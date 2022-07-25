

<!-- get directory sizes of a path / -->
du -cha --max-depth=1 / | grep -E "M|G"

<!-- change the servers timezone -->
dpkg-reconfigure tzdata
