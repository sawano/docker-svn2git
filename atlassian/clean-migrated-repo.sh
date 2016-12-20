#!/bin/bash

not_blank()
{
  if [ -z "$1" ]; then
    echo "The parameter $2 is missing"
	exit 1
  fi
}

HOST_DIR="$1"
not_blank "$HOST_DIR" "HOST_DIR"

docker rm svn2git-atlassian
docker run -d --name svn2git-atlassian -it -v $HOST_DIR:/host-dir sawano/svn-to-git:latest

docker exec svn2git-atlassian sh -c "cd /host-dir/converted-app; java -Dfile.encoding=utf-8 -jar /migration/svn-migration-scripts.jar clean-git --force"

docker stop svn2git-atlassian
docker rm svn2git-atlassian
