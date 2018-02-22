#!/bin/sh
# https://git-scm.com/download/linux
apt-get install git
# git lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

git config --global user.name "Mohamed Eldesouki"
git config --global user.email mohamohamed@qf.org.qa
git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -nosession"

# storing your credential i.e. username and password
# cache option for 15min and store option for ever
git config credential.helper [store|cache]
# Use should also specify caching expire
# After enabling credential caching, it will be cached for 7200 seconds (2 hour).
git config --global credential.helper 'cache --timeout 7200'

git config --global color.ui true

# Use the following project to change the bash prompt
# https://github.com/magicmonty/bash-git-prompt
########################################################################################
################################### Branches ###########################################
########################################################################################

* To look to the current branch
git branch

git branch -r # show you remote branches
git branch -a # show you both i.e. the local ones and the remote ones

To see the reference of the HEAD pointer in the project
cat .git/HEAD
ls -la .git/refs/heads
cat .git/refs/heads/master

* To create a new branch
git branch <branch_name>

* To switch to another branch
git checkout <branch_name>

* To create a branch and check it out at the same time
git checkout -b <branch_name>

*
git log --graph --decorate --all --oneline

* Comparing branches
git --color-words diff <branch_name1>..<branch_name2>

* To show all branches that it is completely included in the current branch
git branch --merged

* To rename a branch
git branch (-m|--move) <old_branch_name> <new_branch_name>

* To delete a branch
git branch (-d|--delete) <branch_name>
git branch -D <branch_name>

########################################################################################
############################### Merging Branches #######################################
########################################################################################
* Merging a branch to the current branch (the reciever)
git merge <branch_name>

* TO force git making new commit in Fast-forward  merge
git merge --no-ff <branch_name>

* To do a merge only if you can do a fast-forward
git merge --ff-only <branch_name>

* To abort merge
git merge --abort

########################################################################################
############################### Stashing changes #######################################
########################################################################################
git stash save  "Massage"
git stash list
git stash pop     [stash@{0}]
git stash apply   [stash@{0}]
git stash drop    stash@{0}
git stash clear

########################################################################################
############################### Remotes ################################################
########################################################################################
git remote
git remote add <alias> <url>
git remote -v          # to show both push and fetch link of a remote
git remote rm <alias>

git push -u <alias> <branch_name> 

git push -u <alias> --all # pushes up the repo and its refs for the first time
git push -u <alias> --tags # pushes up any tags


echo "# This is my README" >> README.md



git clone <url> [dir_name]

git push # if we pushing a tracking  branch

# updates branches origin/master
git fetch <alias> 
# if only we have one remote 
git fetch

git pull  # = git fetch + git merge

# the remote_branch_name is the one in you git that tracks the one in the server (it is not the one in the server)
git branch <branch_name>  <remote_branch_name> 

# to track a remote branch you just need to clone the repo first (if it not in your machine yet) or fetch it and 
# then do {{git branch <branch_name>  <remote_branch_name>}} to create a new branch that is a copy of 
# that <remote_branch_name>

git checkout -b <branch_name>  <remote_branch_name>

git push <alias> :<branch_name_todelete>
git push <alias> --deleted <branch_name_todelete> 


###############################################################################################
#####################  Removing Changes  ######################################################
###############################################################################################

# in case you want to discard changes in working diretory
git checkout -- <file_name>

# in case you want to discard changes that have been staged
git reset HEAD <file_name>

# in case you want to discard the last commit you did
git commit --amend -m "a new massege"

# in case you want to retrieve an older version of a file (it but the older version in the stagging area) .. 
# if you make a commit you will get the old version of the file
# it looks like the git make a new change by itself and did an add after that 
git checkout <SHA_KEY> -- <file_name>

# The revert command just backroll the last commit and add a new commit with the one before .. 
# the log is gonna be commit_1 commit_2 new_commit_1
git revert <SHA_KEY>

### reseting the HEAD of your branch

# this reset the head to the certain SHA but the stagged area has our previous head we need to only commit 
# to return back to our recent SHA
git reset --soft <SHA_KEY>

# this is the default which make the changes are only in the working directory
git reset --mixed <SHA_KEY>

git reset --hard <SHA_KEY>

# this is for forceing the remote repo to also hard reset
git push -f <remote-name> <branch-name>


###########################################################
#######   Push Big Files  #################################
###########################################################
git config --global http.postBuffer 524288000
# https://medium.com/@AyunasCode/how-to-push-large-files-to-github-253d05cc6a09

##############  versions and releases  ###########3########
# https://git-scm.com/book/en/v2/Git-Basics-Tagging

## Workflow
# https://www.atlassian.com/git/tutorials/comparing-workflows








gcc -c -fpic cylinder.c cylinder_wrap.c -I/home/meldesouki/python/include -I/home/meldesouki/python/include/python2.5


















