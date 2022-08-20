Docker by default store logs to one log file. To check log file path run command:

# docker inspect --format='{{.LogPath}}' containername

/var/lib/docker/containers/f844a7b45ca5a9589ffaa1a5bd8dea0f4e79f0e2ff639c1d010d96afb4b53334/f844a7b45ca5a9589ffaa1a5bd8dea0f4e79f0e2ff639c1d010d96afb4b53334-json.log

<hr>

To see live logs you can run below command:

# tail -f `docker inspect --format='{{.LogPath}}' containername`