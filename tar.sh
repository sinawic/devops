# In order to "zip" a directory, the correct command would be
tar -zcvf archive.tar.gz directory/ 

: << 'COMMENT'
This will tell tar to
compress it using the z (gzip) algorithm
c (create) an archive from the files in directory (tar is recursive by default)
v (verbosely) list (on /dev/stderr so it doesn't affect piped commands) all the files it adds to the archive.
and store the output as a f (file) named archive.tar.gz
'COMMENT'

# The tar command offers gzip support (via the -z flag) purely for your convenience. The gzip command/lib is completely separate. The command above is effectively the same as
tar -cv directory | gzip > archive.tar.gz

# To decompress and unpack the archive into the current directory you would use
tar -zxvf archive.tar.gz

# That command is effectively the same as
gunzip < archive.tar.gz | tar -xv