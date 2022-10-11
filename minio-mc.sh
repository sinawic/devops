#!/bin/bash
#title           :minio-mc.sh
#description     :This script is a small cheet sheet for minio client stuff
#author          :sinawic
#date            :20221011

# minio client

# to have access to mc 
docker run -it --rm -v ./minio/minio_storage/bucket3:/files --entrypoint=/bin/sh minio/mc

# to make an alias to remote s3 provider
mc alias set s3 https://someurl.com some-access-key some-secret-key

# list a server's buckets or a bucket's objects
mc ls s3/bucket-name

# add alias to unix commands
alias ls='mc ls'
alias cp='mc cp'
alias cat='mc cat'
alias mkdir='mc mb'
alias pipe='mc pipe'
alias find='mc find'

