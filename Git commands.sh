#!/bin/sh
# https://git-scm.com/download/linux
apt-get install git
# git lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash


git config --global user.name "Mohamed Eldesouki"
git config --global user.email mohamohamed@qf.org.qa
git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -nosession"

# storing your credential i.e. username and password
# cache option for 15min and store option for ever, --global just to store it in the home directory instead of the project dir
git config [--global] credential.helper [store|cache]
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
# save into stash
git stash save  "Massage"
git stash list
git stash [-p] show stash@{0}

# use what in the stash
git stash pop     [stash@{0}]  # # gets the stash out from stash list and remove from there
git stash apply   [stash@{0}]    # same as pop but does not remove it from the stash list

# delete changes in the stash
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
git checkout .
git checkout -f

# If you want to remove untracked files (e.g., new files, generated files):
git clean -f

# Or untracked directories (e.g., new or automatically generated directories):
git clean -fd


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

###########################################################
################   Git lfs installation  ##################
###########################################################
# Navigate to git-lfs.github.com and click Download.
# locate and unzip the downloaded file.
# then CD and run:
sudo bash install.sh
git lfs install # verify installation
git lfs track "*.bin"
git lfs track

# How to remove/delete a large file from commit history in Git repository?
# https://stackoverflow.com/questions/2100907/how-to-remove-delete-a-large-file-from-commit-history-in-git-repository


# Duplicating a repository
# https://help.github.com/articles/duplicating-a-repository/


###########################################################
################   Git lfs installation  ##################
###########################################################
https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys
https://developer.github.com/v3/guides/delivering-deployments/
https://developer.github.com/v3/repos/deployments/


#############################################################
#################  MISC MISC MISC MISC  #####################
#############################################################

warning: adding embedded git repository: SRILM/eval2
hint: You've added another git repository inside your current repository.
hint: Clones of the outer repository will not contain the contents of
hint: the embedded repository and will not know how to obtain it.
hint: If you meant to add a submodule, use:
hint: 
hint: 	git submodule add <url> SRILM/eval2
hint: 
hint: If you added this path by mistake, you can remove it from the
hint: index with:
hint: 
hint: 	git rm --cached SRILM/eval2
hint: 
hint: See "git help submodule" for more information.
-----------------------------------------------------------------

# to force add files even if they are ignored
git add -f directory/*


gcc -c -fpic cylinder.c cylinder_wrap.c -I/home/meldesouki/python/include -I/home/meldesouki/python/include/python2.5


#############################################################
#############################  READING  #####################
#############################################################
https://nvie.com/posts/a-successful-git-branching-model/?fbclid=IwAR2xUD8mNkug3kk70SOT8undMw-J_sA5wqlZo3gY3HACTnDCIuFcxxLyW7Q

https://developer.github.com/

# The legal side of github
https://opensource.guide/legal/#which-open-source-license-is-appropriate-for-my-project

https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow?fbclid=IwAR3cCb3_wwKY-kSSuOrDh3ae-8pmeW1fEIX96jmu0ag3RZCbKhQcQWM1gVU



# Contributing
#############

# https://help.github.com/articles/about-pull-requests/

When contributing, please follow these steps:

- Clone the repo and make your changes.
- Make sure your code has test cases written against it.
- Make sure all the tests pass.
- Lint your code with Flake8.
- Add your name to the list of contributers.
- Submit a Pull Request.

# Open Source Guides
# https://opensource.guide/
# https://guides.github.com/activities/hello-world/












