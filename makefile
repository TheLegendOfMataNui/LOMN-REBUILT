SHELL = cmd
DLTOOL = python tools\pydl.py
BLKTOOL = python tools\blkfile.py
COMPRESSION = decompressed # can also set to compressed
LSSTOOL = tools\lssc\lssc.exe
LSSARGS = Compile -y -r
RELEASETOOL = python tools\releasetool.py
BLOCKFILES = Art/Art.blk characters/blsp.blk characters/bbug.blk characters/bbat.blk characters/bfly.blk characters/btrt.blk characters/blsc.blk characters/krb2.blk characters/btgo.blk characters/akam.blk characters/wair.blk characters/kevn.blk characters/ibox.blk characters/nbua.blk characters/lewa.blk characters/sfsh.blk characters/dfly.blk characters/pira.blk characters/vlgr.blk characters/onua.blk characters/textures.blk characters/bull.blk characters/gali.blk characters/kopa.blk characters/poha.blk characters/when.blk characters/1mns.blk characters/2mns.blk  Languages/lang_eng.blk Sounds/sounds.blk Art/PrinterPics/printerart.blk levels/lev0/frnt.blk levels/lev0/lev0.blk levels/lev1/atrm.blk levels/lev1/bech.blk levels/lev1/ptv1.blk levels/lev1/pzzl.blk levels/lev1/vllg.blk levels/lev1/shrn.blk levels/lev1/lev1.blk levels/lev1/tura.blk levels/lev1/roll.blk levels/lev1/nest.blk levels/lev2/vllg.blk levels/lev2/gly1.blk levels/lev2/gly2.blk levels/lev2/gl3s.blk levels/lev2/mbch.blk levels/lev2/isld.blk levels/lev2/lev2.blk levels/lev2/shrn.blk levels/lev2/tura.blk levels/lev2/mtup.blk levels/lev2/bmtn.blk levels/lev2/bech.blk levels/lev2/strt.blk levels/lev2/hk01.blk levels/lev2/mtop.blk levels/lev3/lev3.blk levels/lev3/blr2.blk levels/lev3/vllg.blk levels/lev3/grhz.blk levels/lev3/blcv.blk levels/lev3/tura.blk levels/lev3/ptos.blk levels/lev3/shrn.blk levels/lev4/vllg.blk levels/lev4/lev4.blk levels/lev4/shrn.blk levels/lev5/le04.blk levels/lev5/Gly1.blk levels/lev5/lev5.blk levels/lev5/vllg.blk levels/lev5/shrn.blk levels/lev5/tura.blk levels/lev6/Mosh.blk levels/lev6/tvil.blk levels/lev6/vllg.blk levels/lev6/shrn.blk levels/lev6/tura.blk levels/lev6/lev6.blk levels/lev8/endg.blk levels/lev8/vine.blk levels/lev8/lstn.blk levels/lev8/ptv0.blk levels/lev8/ruin.blk levels/lev5/Illu.blk levels/lev8/lev8.blk levels/lev8/trap.blk levels/lev8/ttop.blk levels/lev8/bdge.blk levels/lev8/bmtn.blk levels/lev8/bech.blk levels/lev8/bglw.blk levels/lev8/lost.blk levels/lev8/tura.blk levels/lev8/clmb.blk levels/lev8/gvlg.blk levels/lev8/ovlg.blk levels/lev8/labr.blk levels/lev8/kini.blk Main.blk characters/msqt.blk characters/wind.blk characters/tahu.blk characters/mudm.blk characters/gtva.blk characters/rrun.blk characters/bats.blk characters/ibat.blk characters/oewa.blk characters/bspd.blk characters/imon.blk characters/spid.blk characters/vine.blk characters/tspd.blk characters/crb1.blk characters/lsrp.blk characters/hydr.blk characters/turt.blk characters/shrk.blk characters/ttrt.blk characters/tfsh.blk characters/nUju.blk characters/btfr.blk characters/Textures.blk characters/bugz.blk characters/vaka.blk characters/wrat.blk characters/ssss.blk characters/drag.blk characters/bsrp.blk characters/mata.blk characters/rkmn.blk characters/noka.blk characters/fbug.blk characters/viki.blk characters/rama.blk characters/btva.blk Languages/lang_swe.blk Languages/lang_dan.blk Languages/lang_dut.blk Languages/lang_spa.blk Languages/lang_frn.blk Languages/lang_ger.blk Languages/lang_ita.blk levels/lev1/bugs.blk levels/lev1/l1a8.blk levels/lev1/l1a1.blk levels/lev1/scrp.blk levels/lev1/clf2.blk levels/lev1/spcv.blk levels/lev1/l1a3.blk levels/lev1/cave.blk levels/lev1/hk01.blk levels/lev1/clf1.blk levels/lev1/mdmn.blk levels/lev1/l1a7.blk levels/lev2/vtnl.blk levels/lev2/wthk.blk levels/lev2/mwat.blk levels/lev2/hydr.blk levels/lev2/takv.blk levels/lev2/vlgs.blk levels/lev2/evac.blk levels/lev2/ttun.blk levels/lev2/gly3.blk levels/lev3/gly1.blk levels/lev3/bkik.blk levels/lev3/rkmn.blk levels/lev3/blr1.blk levels/lev3/xrod.blk levels/lev3/rkfl.blk levels/lev3/mtup.blk levels/lev3/gly3.blk levels/lev3/bldr.blk levels/lev4/visn.blk levels/lev4/well.blk levels/lev4/strt.blk levels/lev4/brd4.blk levels/lev4/path.blk levels/lev4/gly1.blk levels/lev4/swrd.blk levels/lev4/snfl.blk levels/lev4/icmn.blk levels/lev4/Tele.blk levels/lev4/crss.blk levels/lev4/brd2.blk levels/lev4/maz2.blk levels/lev4/icmz.blk levels/lev4/brd3.blk levels/lev4/maz1.blk levels/lev4/tura.blk levels/lev4/snbd.blk levels/lev5/le03.blk levels/lev5/gly1.blk levels/lev5/hive.blk levels/lev5/wdmn.blk levels/lev5/lep1.blk levels/lev5/le08.blk levels/lev5/le02.blk levels/lev5/mtup.blk levels/lev5/lep2.blk levels/lev5/room.blk levels/lev5/le01.blk levels/lev5/cave.blk levels/lev6/ta08.blk levels/lev6/ta10.blk levels/lev6/tp03.blk levels/lev6/ta12.blk levels/lev6/ta05.blk levels/lev6/fvil.blk levels/lev6/ta02.blk levels/lev6/ta11.blk levels/lev6/drgn.blk levels/lev6/ta14.blk levels/lev6/ta07.blk levels/lev6/tp02.blk levels/lev6/ta01.blk levels/lev6/ta13.blk levels/lev6/ta04.blk levels/lev6/tp01.blk levels/lev6/mtup.blk levels/lev6/ta03.blk levels/lev6/ta09.blk levels/lev7/kuta.blk levels/lev7/tahu.blk levels/lev7/lewa.blk levels/lev7/phtu.blk levels/lev7/onua.blk levels/lev7/lev7.blk levels/lev7/kpka.blk levels/lev7/pst1.blk levels/lev7/pst2.blk levels/lev7/mana.blk levels/lev7/man1.blk levels/lev7/man3.blk levels/lev7/gali.blk levels/shoe/shoe.blk levels/shoe/sbec.blk levels/test/test.blk levels/test/tst1.blk levels/test/tst2.blk levels/test/tst5.blk levels/test/tst6.blk
FMVS = AnimationTests.bik behindthescenes.bik BIONICLEFMV3.bik BIONICLETRAILER.bik CreditsFMV1.bik ewokCelebration.bik LegendFMVEn.bik LegendFMVFr.bik New_LOGO8015.bik New_Saffirelogo.bik ToaKaitaFight.bik ToaKiniMeeting.bik LegendFMVDan.bik LegendFMVGer.bik LegendFMVIta.bik LegendFMVNl.bik LegendFMVSpa.bik LegendFMVSwe.bik
FMVVERSION = 1.1
NATIVE_SOURCES = $(wildcard ./native/*.*) $(wildcard ./native/*/*.* ) $(wildcard ./native/*/*/*.* ) $(wildcard ./native/*/*/*/*.* ) $(wildcard ./native/*/*/*/*/*.* )
NATIVE_OUTPUTS = $(patsubst ./native/%,./build/%, $(NATIVE_SOURCES))
LSS_SOURCES = $(wildcard ./script/*.lss) $(wildcard ./script/*/*.lss) $(wildcard ./script/*/*/*.lss) $(wildcard ./script/*/*/*/*.lss) $(wildcard ./script/*/*/*/*/*.lss) $(wildcard ./script/*/*/*/*/*/*.lss) $(wildcard ./script/*/*/*/*/*/*/*.lss) $(wildcard ./script/*/*/*/*/*/*/*/*.lss) $(wildcard ./script/*/*/*/*/*/*/*/*/*.lss) $(wildcard ./script/*/*/*/*/*/*/*/*/*/*.lss) $(wildcard ./script/*/*/*/*/*/*/*/*/*/*/*.lss)
OSI_OUTPUT = ./build/data/Base.osi

default: build

build: fmvs native script data blockfiles

clean:
	@if exist build\NUL rmdir build /s /q
	@if exist packaged\NUL rmdir packaged /s /q

run: build
	@start build\LEGOBionicle.exe

rebuild:
	@$(MAKE) -s clean
	@$(MAKE) -s build

.PHONY: extract diff release

# 
# Utility recipe for building releases (self-extracting 7z)
# 
release: ./packaged/PatchR.exe

diff: build
	$(RELEASETOOL) package build\ "vanilla snapshot.txt" packaged\patch\

./packaged/PatchR.exe: diff
	@if exist packaged\PatchR.exe rmdir packaged\PatchR.exe
	@cd packaged\patch\ && ..\..\tools\7zip\7za.exe a -sfx7z.sfx ..\PatchR.exe *

# 
# Utility recipe for extracting existing blockfiles.
# 
extract: $(addsuffix .tmp,$(basename $(wildcard ./blockfiles_packed/*.blk) $(wildcard ./blockfiles_packed/*/*.blk) $(wildcard ./blockfiles_packed/*/*/*.blk) $(wildcard ./blockfiles_packed/*/*/*/*.blk) $(wildcard ./blockfiles_packed/*/*/*/*/*.blk)))

./blockfiles_packed/%.tmp:
	@echo Blockfile: $(addsuffix .blk,$(basename $@))
	@if exist $(subst _packed,_extracted,$(subst /,\,$(basename $@)))\NUL rmdir $(subst _packed,_extracted,$(subst /,\,$(basename $@))) /s /q
	@if not exist $(subst _packed,_extracted,$(subst /,\,$(dir $@)))\NUL mkdir $(subst _packed,_extracted,$(subst /,\,$(dir $@)))
	@$(BLKTOOL) -o $(subst _packed,_extracted,$(subst /,\,$(basename $@)))\ $(addsuffix .blk,$(basename $@))

#
# FMVs downloaded from the GitHub release to data/Cinematics
#
fmvs: cleanparts $(addprefix ./data/Cinematics/,$(FMVS))

cleanparts:
	@del .\\data\\Cinematics\\*.part 2> NUL

./data/Cinematics/%:
	@echo Downloading '$@'...
	@$(DLTOOL) https://github.com/TheLegendOfMataNui/FMVs/releases/download/$(FMVVERSION)/$(notdir $@) $@

# 
# Native files copied from native/
# 
native: $(NATIVE_OUTPUTS)

./build/%: ./native/%
	@echo Copying '$@'...
	@if not exist $(subst /,\,$(dir $@))NUL mkdir $(subst /,\,$(dir $@))
	@copy /B $(subst /,\,$<) $(strip $(subst /,\,$@)) > NUL
	@if not exist .\build\scripting\slks\shoefitter\onua\NUL mkdir .\build\scripting\slks\shoefitter\onua

# 
# Script files are compiled from script/ with lssc
# 
script: $(OSI_OUTPUT)

$(OSI_OUTPUT): $(LSS_SOURCES)
	@echo Compiling '$@'...
	@if not exist $(subst /,\,$(dir $@))NUL mkdir $(subst /,\,$(dir $@))
	@$(LSSTOOL) $(LSSARGS) ./script -o $(subst /,\,$@) 

# 
# Data files are copied from data/
# 
DATA_SOURCES = $(addprefix ./data/Cinematics/,$(FMVS)) $(wildcard ./data/*.*) $(wildcard ./data/*/*.*) $(wildcard ./data/*/*/*.*) $(wildcard ./data/*/*/*/*.*) $(wildcard ./data/*/*/*/*/*.*) $(wildcard ./data/*/*/*/*/*/*.*)
DATA_OUTPUTS = $(patsubst ./data/%,./build/data/%,$(DATA_SOURCES))
data: $(DATA_OUTPUTS)

./build/data/%: ./data/%
	@echo Copying '$@'...
	@if not exist $(subst /,\,$(dir $@))NUL mkdir $(subst /,\,$(dir $@))
	@copy /B $(subst /,\,$<) $(strip $(subst /,\,$@)) > NUL

# 
# Blockfiles are packaged from blockfiles/ with blkfile.py
# 
blockfiles: $(addprefix ./build/data/,$(BLOCKFILES))

.SECONDEXPANSION:

./build/data/%.blk: $$(wildcard ./blockfiles/%/*.*)
	@echo Packaging '$@'...
	@if not exist $(subst /,\,$(dir $@))NUL mkdir $(subst /,\,$(dir $@))
	@if not exist $(subst /,\,$(patsubst build/data/%.blk,./blockfiles/%,$@))\NUL mkdir $(subst /,\,$(patsubst build/data/%.blk,./blockfiles/%,$@))
	@if exist $(subst /,\,$@) del $(subst /,\,$@)
	@$(BLKTOOL) --$(if $(wildcard $(patsubst build/data/%.blk,./blockfiles/%/.nocompress,$@)),decompressed,$(COMPRESSION)) -o $@ $(patsubst build/data/%.blk,./blockfiles/%,$@) > NUL
