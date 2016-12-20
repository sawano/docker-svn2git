#!/bin/bash

not_blank()
{
  if [ -z "$1" ]; then
    echo "The parameter $2 is missing"
	exit 1
  fi
}

SVN_REPO_URL="$1"
not_blank "$SVN_REPO_URL" "SVN_REPO_URL"
HOST_DIR="$2"
not_blank "$HOST_DIR" "HOST_DIR"

docker rm svn2git-atlassian
docker run -d --name svn2git-atlassian -it -v $HOST_DIR:/host-dir sawano/svn2git:latest

docker exec svn2git-atlassian sh -c "git svn clone --stdlayout --authors-file=/host-dir/authors.txt $SVN_REPO_URL /host-dir/converted-repo"

docker stop svn2git-atlassian
docker rm svn2git-atlassian
