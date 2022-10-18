#!/bin/bash
#title           :zip.sh
#description     :This is a cheat sheet of zip command in unix env
#author          :sinawic
#date            :20220914

# 
# zip command cheat sheet
# 

# install the zip command
sudo apt install zip unzip

# to compress a folder
zip -r filename.zip folder
zip -r filename.zip folder1 folder2
zip -r filename.zip /path/to/folder1 /path/to/file2

# Verify file with the ls command:
ls -l data.zip

# encrypt data.zip with a password by passing the -e option:
zip -r -e data.zip /path/to/folder1

# state password on the CLI to encrypt zipfile entries:
zip -r -e -P 'YOUR_PASSWORD_HERE' output.zip /path/to/folder/

# zip a directory and exclude a directory <volumes> inside it
zip -r file.zip dir/ -x dir/volumes/**\*

# Option  Description
: << 'COMMENT'
-f  freshen: only changed files
-u	update: only changed or new files
-d	delete entries in zipfile
-m	move into zipfile (delete OS files)
-r	recurse into directories
-j	junk (don't record) directory names
-0	store only
-l	convert LF to CR LF (-ll CR LF to LF)
-1	compress faster
-9	compress better
-q	quiet operation
-v	verbose operation/print version info
-c	add one-line comments
-z	add zipfile comment
-@	read names from stdin
-o	make zipfile as old as latest entry
-x	exclude the following names
-i	include only the following names
-F	fix zipfile (-FF try harder)
-D	do not add directory entries
-A	adjust self-extracting exe
-J	junk zipfile prefix (unzipsfx)
-T	test zipfile integrity
-X	eXclude eXtra file attributes
-y	store symbolic links as the link instead of the referenced file
-e	encrypt
-n	don't compress these suffixes
-h2	show more help
COMMENT