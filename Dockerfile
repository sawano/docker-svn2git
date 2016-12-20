# See https://www.atlassian.com/git/tutorials/migrating-overview and https://github.com/nirvdrum/svn2git
# for more info on the included tools.
#
# docker build -t sawano/svn-to-git:latest .
# docker run -it --name svn2git sawano/svn-to-git:latest
#

FROM ubuntu:16.04
MAINTAINER Daniel Sawano
RUN apt-get update && \
    apt-get -y --no-install-recommends install \
    git-core=1:2.7.4-0ubuntu1 \
    git-svn=1:2.7.4-0ubuntu1 \
    subversion=1.9.3-2ubuntu1 && \
    rm -rf /var/lib/apt/lists

# Atlassian specifics
RUN apt-get update && \
    apt-get -y --no-install-recommends install \
    curl \
    openjdk-8-jre && \
    rm -rf /var/lib/apt/lists

# svn2git specifics
RUN apt-get update && \
    apt-get -y --no-install-recommends install \
    ruby=1:2.3.0+1 && \
    rm -rf /var/lib/apt/lists && \
    gem install svn2git -v 2.4.0

WORKDIR migration

RUN curl -LO https://bitbucket.org/atlassian/svn-migration-scripts/downloads/svn-migration-scripts.jar

RUN touch verify.sh; chmod +x verify.sh && \
    echo "java -jar /migration/svn-migration-scripts.jar verify" >> verify.sh
