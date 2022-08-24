

<!-- get directory sizes of a path / -->
du -cha --max-depth=1 / | grep -E "M|G"

<!-- change the servers timezone -->
dpkg-reconfigure tzdata

<!-- Extract JAR file -->
jar xvf /path/to/file.jar
<!-- or -->
unzip /path/to/file.jar

<!-- lists all files inside zip file -->
unzip -l /path/to/file.jar

