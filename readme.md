The Legend of Mata Nui
======================

This repo contains everything needed to build the game.

Prerequisites
-------------

To build LOMN, you need:
 - [Python 3+](https://www.python.org/downloads/) on your `PATH` for packaging the blockfiles

Building
--------

Open a command prompt in the base directory and run `make`. It will take a long time the first time, but it won't need your input while it's building, so you can go do whatever.  
The built game will be created in the `build/` directory, and you can run it by opening `LEGOBionicle.exe`.

You can also run `make clean` to delete the `build/` folder, `make rebuild` to `clean` and then build, or `make run` to `build` and then launch the game.

To package just the files that have changed from the vanilla build of the game, run `make release`, and the modified files will be copied to the `packaged/patch/` folder.

When using `make`, you can use ` COMPRESSION=compressed` with a `make` command (e.g. `make COMPRESSION=compressed`) to compress the blockfiles, but be warned: they will not be rebuilt even if they are up-to-date but not compressed, and compression will slow the process down significantly.

**NOTE**
If you modify or add a file in a blockfile, running `make` will rebuild that blockfile. However, deleting or renaming a file in a blockfile will not be detected by `make` because the file's last-modified time will not have been updated, so you will need to manually trigger the rebuild by either deleting the corresponding `.blk` file in the `build/data/` directories, or running `make clean` to rebuild the whole game. (Again, this takes a long time!)

Script Development
------------------

Because LSS has been introduced, quite recently, there is currently no text editing support for it.

However, you can get a pretty decent approximation by using the C# or Java language modes of your text editor.