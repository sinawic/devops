#!/bin/bash

# Toggle some informations about the root filesystem:
df /
# Filesystem     1K-blocks    Used Available Use% Mounted on
# /dev/sda2       31365948 5249140  24500424  18% /

# /dev/sda2 is the second partition of block device /dev/sda. To size up this partition,
# you can use the tool parted.

parted /dev/sda
# (parted) resizepart 2
# Warning: Partition /dev/sda2 is being used. Are you sure you want to continue?
# Yes/No? yes
# End?  [41.0GB]? 82GB
# (parted) q
# Information: You may need to update /etc/fstab.


# After changing size of partition, you have to size up the filsystem too:
resize2fs /dev/sda2
# resize2fs 1.45.5 (07-Jan-2020)
# Filesystem at /dev/sda2 is mounted on /; on-line resizing required
# old_desc_blocks = 4, new_desc_blocks = 9
# The filesystem on /dev/sda2 is now 18019403 (4k) blocks long.


# This is for checking modifications:
df /
# Filesystem     1K-blocks    Used Available Use% Mounted on
# /dev/sda2       70817420 5253016  62349464   8% /


# 
# for btrfs file system which would throw error on resize2fs level use:
# sudo btrfs filesystem resize max /