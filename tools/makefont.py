# FINAL VERSION OF THIS PROGRAM THIS IS THE DUMBEST THING EVER
# by ondrik
# go yell at me when this breaks (when, not if)

# OBLIGATORY IMPORTS
import os
import blkfile # JMMB's thing, for LZSS
import sys
from PIL import Image
import io
import on_split # my thing, for the pictures
import struct # because python 2


# variables and arguments
compress = False

input_folder = sys.argv[1]

output_folder = sys.argv[2]

# Yes, using this instead of an actual command line library is dumb - Too bad!
if "--help" in sys.argv:
    print("Final font tool")
    print("Coded by Ondrik, with help from JMMB")
    print("Usage: makefont.py <input folder> <output folder> FONTS [-c]")
    print("Options:")
    print("    --help               Show this screen")
    print("    -c, --compression    Compress everything (must be at the end)")
    exit()

# entry in an FNT file
class FNTEntry:
    def __init__(self, c, w, h, k, b, m):
        self.code = c
        self.width = w
        self.height = h
        self.kerning = k
        self.baseline = b
        self.manual = m

def BKDRHash(istr):  # thank you jmmb
    # print("Taking in",istr)
    seed = 131
    ohash = 0
    for char in istr:
        ohash = (ohash*seed)+ord(char)
    # print("Returning",ohash & 0xFFFFFFFF)
    return ohash & 0xFFFFFFFF

# number to 4 bytes, this time with little/big endian, and signed support
def convert(var, byteorder='little', s=True):
    try: # if python 3
        final = list(var.to_bytes(4, byteorder=byteorder, signed=s))
    except: # else
        format = "<" if byteorder == 'little' else ">"
        f2 = "i" if s is True else "I"
        final = list(struct.pack(format+f2, var))
        final = [ord(el) for el in final]
    return final # finally learned how this works!

# image object to a list of bytes - this allows the program to keep everything in memory instead of spewing a bunch of TGAs everywhere
def image_to_ints(image):
    img_bytes = io.BytesIO()
    image.save(img_bytes, "TGA", compression="tga_rle") # this ignores the compression flag, as it doesn't really waste any time
    # image.save(img_bytes, "TGA")
    img_bytes = img_bytes.getvalue()
    return list(img_bytes)

# here's everything done
def do_the_thing(font):
    global input_folder # just in case, globals
    global output_folder
    imagefile = input_folder+font
    infofile = input_folder+font+".txt"
    args = on_split.get_args(infofile)
    tile_width = int(args[0])  # used for splitting
    tile_height = int(args[1])  # used for splitting
    kerning = int(args[2])  # indeed it's used
    baseline = int(args[3])  # loading bar
    space_size = int(args[4])  # for the header
    if args[5] != "0 0 0 0": # backwards compatibility with the old files, because yes
        color = int(args[5])
    else:
        color = 1
    chars = args[6]  # needed
    bchars = []
    i = 0
    while i < len(chars): # this does the whole special characters thing
        try:
            if chars[i] != "\\":
                bchars.append(ord(chars[i]))
            else:
                high = chars[i + 2]
                low = chars[i + 3]
                bchars.append(int(high + low, 16))
                i += 3
                # input()
            # print(chars[i])
            i += 1
        except IndexError:
            pass

    try:
        manual_table = on_split.kerntable(args[7], bchars) # does a kerning table exist?
        # print("Manual table generated!")
    except:
        # print("No manual table!")
        # print(args[7])
        manual_table = {} # if it doesn't, initialize it as empty
        pass

    try: # hopefully self-explanatory
        im = Image.open(imagefile+".tif")
    except:
        try:
            print("TIF not found - Falling back to TGA")
            im = Image.open(imagefile+".tga")
        except:
            print("TGA not found - falling back to PNG")
            try:
                im = Image.open(imagefile+".png")
            except:
                print("PNG not found")
                exit()
    splitfiles = on_split.split_up(im, tile_width, tile_height)
    # now we have the letters individually
    entries = []
    for i in range(len(splitfiles)):
        down = splitfiles[i].resize((tile_width // color, tile_height // color), resample=Image.BICUBIC)
        # BICUBUC seems like the best downscaling as it lead to the best auto-kerning
        left = on_split.find_left_edge(down) # all the edges
        right = on_split.find_right_edge(down)
        top = on_split.find_top_edge(splitfiles[i])
        bottom = on_split.find_bottom_edge(splitfiles[i])
        charwidth = (right - left) + 1 # parameters
        # charwidth = right
        charheight = bottom - top
        ckerning = left
        cbase = tile_height - (bottom + 1) # the baseline doesn't do anything for individual characters iirc
        """print("Inferences:")
        print("Width:", charwidth)
        print("Height:", charheight)
        print("Kerning:", ckerning)
        print("Baseline:", cbase)"""
        # print("Adding entry:", i)
        try: # there's probably a cleaner way to do this, but hey
            # print("Manual kerning found!", manual_table[bchars[i]])
            entries.append(FNTEntry(bchars[i], charwidth, charheight, ckerning, cbase, manual_table[bchars[i]]))
        except KeyError:
            # print("No manual kerning found!")
            entries.append(FNTEntry(bchars[i], charwidth, charheight, ckerning, cbase, 0))

    fnt = [] # FNT file creation
    fnt.extend(convert(1))
    fnt.extend(convert(len(entries)))
    fnt.extend(convert(len(entries)))
    fnt.extend(convert(tile_width//color)) # "color" in original files --> "rescale factor" in ours
    fnt.extend(convert(tile_height//color))
    fnt.extend(convert(kerning//color))
    fnt.extend(convert(baseline)) # baseline unaffected - it influences the loading bar and nothing else?
    fnt.extend(convert(space_size//color))

    for entry in entries:
        fnt.append(entry.code)
        fnt.append(0)
        fnt.extend(convert(entry.width - entry.manual))
        fnt.extend(convert(entry.height//color)) #this is a bit weird, but it works?
        fnt.extend(convert(entry.kerning + entry.manual))
        fnt.extend(convert(int(round(entry.baseline/color)))) # same here?

    # fnt is now a list of ints
    all_files = [image_to_ints(f) for f in splitfiles] # this is a list of files - all the TGAs, specifically

    all_files.append(fnt) # here's the FNT file - all of these will then be packed

    all_names = [font+"0_"+str(i)+".tga" for i in range(len(splitfiles))]+[font+".fnt"] # they have to be named, of course
    # first all the letters sequentially, then the FNT file
    # this is a list of strs
    # yay now it's all done
    all_hashes = {BKDRHash(all_names[i]): i for i in range(len(all_names))}
    # hashes - a dictionary comprehension to match them with the index easily
    # python 2 weirdness happens, unfortunately
    """
        This 'python 2 weirdness' is caused by dictionary sorting
        While Python 3 can sort a dictionary according to keys, Python 2 uses some custom hashes
        Since this doesn't order the pairs correctly for a font, it crashes the game
    """
    sorted_hashes = sorted(all_hashes)
    sorted_indices = [all_hashes[i] for i in sorted_hashes] # sorted_indices is the indices sorted in the order of the hashes
    sorted_list = {i: all_hashes[i] for i in sorted(all_hashes)}
    # print(all_hashes)
    # print(sorted(all_hashes))
    # print(sorted_list)
    # the index we need is for all_files
    # all_hashes

    # sorted_list[i] = index into the files
    # all_names[sorted_list[i]] = name
    # all_files[sorted_list[i]] = file

    full_col_file = convert(2, 'big') # creating the .col
    full_col_file.extend(convert(len(sorted_list), 'big'))
    full_col_file.extend(convert(4, 'big'))
    getback = [len(full_col_file)] # pointers, I believe
    full_col_file.extend(convert(0, 'big'))  # FILE SIZE - GET BACK TO THIS
    full_col_file.extend([255] * 20)


    """for i in sorted_list:
        print(i)
        print(sorted_list[i])
        print(all_names[sorted_list[i]])
        print(all_files[sorted_list[i]][:100])
        input()"""


    compflag = {} # compression defined on per-file basis

    for i in range(len(sorted_hashes)): # for every hash
        the_hash = convert(sorted_hashes[i], 'big', False) # hash is converted and added to file
        # print("Hash incoming",sorted_hashes[i])
        # print(the_hash)
        # input()
        full_col_file.extend(the_hash)
        if compress and all_names[sorted_indices[i]][-3:] == "tga": # if --compression and the file is a .tga
            full_col_file.extend(convert(17, 'big'))
            compflag[sorted_indices[i]] = True # compress
        elif compress and all_names[sorted_indices[i]][-3:] != "tga": # if --compression and the file is NOT a .tga
            full_col_file.extend(convert(1, 'big'))
            compflag[sorted_indices[i]] = False # don't compress
        else: # if --compression isn't entered
            full_col_file.extend(convert(1, 'big'))
            compflag[sorted_indices[i]] = False # don't compress
        getback.append(len(full_col_file)) # adds a place to come back to
        full_col_file.extend(convert(0, 'big')) # appends 0, this is the pointer, I think
        full_col_file.extend(convert(len(all_files[sorted_indices[i]]), 'big')) # length of uncompressed file
    # indices done
    gb2 = [] # getback2
    for i in range(len(sorted_hashes)): # for every hash
        data = all_files[sorted_indices[i]] # data taken from the list of bytes
        if compflag[sorted_indices[i]]: # if it's set to compress
            lzss = blkfile.BLKLZSS() # thank you jmmb
            data = lzss.encode(bytearray(data)) # encoding
        gb2.append(len(full_col_file)) # the length of the col file is appended to getback2
        # print(hex(len(full_col_file)))
        full_col_file.extend(list(data)) # the col file is extended with the new file
        # print("Packing", sorted_list[i])
        while (len(full_col_file) % 2 != 0): # padding
            full_col_file.append(0)
        # input()
    gb2.append(len(full_col_file)) # the length of the col file is again appended
    # print(hex(len(full_col_file)))
    getback.append(getback.pop(0)) # clever use of python here - the first entry is moved to the end
    getback_values = [list(convert(var, 'big')) for var in gb2] # the values we have are converted to bytes
    # input()
    for i in range(len(getback)): # for all these pointers
        for l1 in range(4): # 4 bytes each
            full_col_file[getback[i] + l1] = getback_values[i][l1] # the pointer is written to the addresses
    with open(output_folder+font + ".col", 'wb') as the_file: # binary write, simple thing
        the_file.write(bytearray(full_col_file))
    print("Complete!")




# takes in every argument after the 3rd one

fonts = sys.argv[3:]

#if the last one is compression, it's popped from the list of "fonts"
if "-c" in fonts or "--compression" in fonts:
    fonts.pop(-1)
    compress = True # the compression flag is also set to true

for font in fonts:
    print("Creating",font)
    do_the_thing(font)
