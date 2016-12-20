# Utilities to migrate SVN repository to Git

There are two tools to chose from. svn2git svn2git [https://github.com/nirvdrum/svn2git](https://github.com/nirvdrum/svn2git), and a tool provided by Atlassaian ([https://www.atlassian.com/git/tutorials/migrating-overview](https://www.atlassian.com/git/tutorials/migrating-overview)).

## svn2git

This is the tool svn2git [https://github.com/nirvdrum/svn2git](https://github.com/nirvdrum/svn2git) packaged as a Docker container. It's been packaged to simplify installment of the actual tools needed. The Docker image will be built automatically by the scripts.

### Prerequisites
* Docker installed
* Tweak the shell scripts if you need to add more options to svn2git.

### How to migrate

The steps involved are:

* Run `extract-authors.sh`
* Edit `authors.txt`
* Run `migrate-to-git.sh` (this can take a while)
* Check that the local Git repo is ok
* Push to remote Git repo (e.g. GitHub, Stash)

First run `extract-authors.sh` to extract the users from the SVN repos.

E.g.:
````
extract-authors.sh http://mydomain.example.com/repos/my/repo $PWD
````

This will create a file authors.txt. Edit that file and add names and emails to use in the Git repo. E.g. final file should look like:

````
john = John Doe <john.doe@example.com>
jane = Jane Doe <jane.doe@example.com>
````

Once you're done you can run `migrate-to-git.sh`. E.g.:

````
migrate-to-git.sh http://mydomain.example.com/repos/my/repo $PWD
````

## Atlassian tool

This is the tool from Atlassian [https://www.atlassian.com/git/tutorials/migrating-overview](https://www.atlassian.com/git/tutorials/migrating-overview) packaged as a Docker container. It's been packaged to simplify installment of the actual tools needed. The Docker image will be built automatically by the scripts.

### Prerequisites
* Docker installed
* Tweak the shell scripts if you need to add more options to svn2git.

### How to migrate

The steps involved are:

* Run `extract-authors.sh`
* Edit `authors.txt`
* Run `migrate-to-git.sh` (this can take a while)
* Run `clean-migrated-repo.sh`
* Check that the local Git repo is ok
* Push to remote Git repo (e.g. GitHub, Stash)

First run `extract-authors.sh` to extract the users from the SVN repos.

E.g.:
````
extract-authors.sh http://mydomain.example.com/repos/my/repo $PWD
````

This will create a file authors.txt. Edit that file and add names and emails to use in the Git repo. E.g. final file should look like:

````
john = John Doe <john.doe@example.com>
jane = Jane Doe <jane.doe@example.com>
````

Once you're done you can run `migrate-to-git.sh`. E.g.:

````
migrate-to-git.sh http://mydomain.example.com/repos/my/repo $PWD
````
