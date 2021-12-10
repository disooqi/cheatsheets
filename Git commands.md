
* https://git-scm.com/download/linux
```bash
apt-get install git
```

* https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh

```bash
git config --global user.name "Mohamed Eldesouki"
git config --global user.email disooqi@gmail.com
git config --global core.filemode false
git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -nosession"
git config --global core.editor "vim"
```

* storing your credential i.e. username and password
* cache option for 15min and store option for ever, --global just to store it in the home directory instead of the project dir
```bash
git config [--global] credential.helper [store|cache]
```

* Use should also specify caching expire
* After enabling credential caching, it will be cached for 7200 seconds (2 hour).
```bash
git config --global credential.helper 'cache --timeout 7200'
git config --global credential.helper store

git config --global color.ui true
```

* Use the following project to change the bash prompt
* https://github.com/magicmonty/bash-git-prompt


## Git log

```bash
git log --graph --decorate --all --oneline

git log -p -2 --stat --pretty=[oneline|short|full|filter|format=""] --graph
```

## Branches 


* To look to the current branch
```bash
git branch

git branch -r # show you remote branches
git branch -a # show you both i.e. the local ones and the remote ones
```
To see the reference of the HEAD pointer in the project
```bash
cat .git/HEAD
ls -la .git/refs/heads
cat .git/refs/heads/master
```

* To create a new branch
```bash
git branch <branch_name>
```

* To switch to another branch
```bash
git checkout <branch_name>
```

* To create a branch and check it out at the same time
```bash
git checkout -b <branch_name>
```

* To create the branch via a hash
```bash
git checkout -b <branch_name> <sha1-of-commit>
```

* Comparing branches
```bash
git --color-words diff <branch_name1>..<branch_name2>
```

* To show all branches that it is completely included in the current branch
```bash
git branch --merged
```

* To rename a branch
```bash
git branch (-m|--move) <old_branch_name> <new_branch_name>
```

* To delete a branch
* The -d option is an alias for --delete, which only deletes the branch if it has already been fully merged in 
* its upstream branch. You could also use -D, which is an alias for --delete --force, which deletes the branch 
* "irrespective of its merged status." [Source: man git-branch]
```bash
git branch (-d|--delete) <branch_name>
git branch -D <branch_name>
```


## Merging Branches

* Merging a branch to the current branch (the reciever)
```bash
git merge <branch_name>
```

* TO force git making new commit in Fast-forward  merge
```bash
git merge --no-ff <branch_name>
```

* To do a merge only if you can do a fast-forward
```bash
git merge --ff-only <branch_name>
```

* To abort merge
```bash
git merge --abort
```


## Stashing changes
* save into stash
```bash
git stash save  "Massage"
git stash list
git stash [-p] show stash@{0}
```

* use what in the stash
```bash
git stash pop     [stash@{0}]  # # gets the stash out from stash list and remove from there
git stash apply   [stash@{0}]    # same as pop but does not remove it from the stash list
```

* delete changes in the stash
```bash
git stash drop    stash@{0}
git stash clear
```


## Remotes 
```bash
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
```

* updates branches origin/master
```bash
git fetch <alias> 
```

* if only we have one remote 
```bash
git fetch

git pull  # = git fetch + git merge
```

* To track a remote branch you just need to clone the repo first (if it not in your machine yet) or fetch it and 
* then do {{git branch <branch_name>  <remote_branch_name>}} to create a new branch that is a copy of 
* that <remote_branch_name>
* The remote_branch_name is the one in you git that tracks the one in the server (it is not the one in the server)
```bash
git branch <branch_name>  <remote_branch_name>  # or
git checkout -b <branch_name>  <remote_branch_name>
```
* The above is old you can use the new command of `git switch` as following:
```
git switch -c <branch> --track <remote>/<branch>
# or simply, (if you use the same name as the remote branch and you don't have different remotes with same branch)
git switch <branch>
```


* Delete remote branch
```bash
git push <alias> :<branch_name_todelete> # or
git push <alias> [-d|--delete] <branch_name_todelete> 
```


##  Removing Changes
* in case you want to discard changes in working diretory
```bash
git checkout -- <file_name>
git checkout .
git checkout -f
```

* If you want to remove untracked files (e.g., new files, generated files):
```bash
git clean -f
```
* Or untracked directories (e.g., new or automatically generated directories):
```bash
git clean -fd
```

* in case you want to discard changes that have been staged
```bash
git reset HEAD <file_name>
```
* in case you want to discard the last commit you did
```bash
git commit --amend -m "a new massege"
```
* in case you want to retrieve an older version of a file (it but the older version in the stagging area) .. 
* if you make a commit you will get the old version of the file
* it looks like the git make a new change by itself and did an add after that 
```bash
git checkout <SHA_KEY> -- <file_name>
```
* The revert command just backroll the last commit and add a new commit with the one before .. 
* the log is gonna be commit_1 commit_2 new_commit_1
```bash
git revert <SHA_KEY>
```
### reseting the HEAD of your branch

* this reset the head to the certain SHA but the stagged area has our previous head we need to only commit 
* to return back to our recent SHA
```bash
git reset --soft <SHA_KEY>
```
* this is the default which make the changes are only in the working directory
```bash
git reset --mixed <SHA_KEY>
git reset --hard <SHA_KEY>
```

* this is for forceing the remote repo to also hard reset
```bash
git push -f <remote-name> <branch-name>
```

## Merging A Pull Request via command line
* Step 1: From your project repository, bring in the changes and test.
```bash
git fetch origin
git checkout -b my-slide origin/my-slide
git merge main
```
* Step 2: Merge the changes and update on GitHub.
```bash
git checkout main
git merge --no-ff my-slide
git push origin main
```


## Push Big Files  
```bash
git config --global http.postBuffer 524288000
* https://medium.com/@AyunasCode/how-to-push-large-files-to-github-253d05cc6a09
```
## Tagging and releases
* http://practicalseries.com/1002-vcs/09-06-github.html#js--090600
* https://git-scm.com/book/en/v2/Git-Basics-Tagging

## Workflow
* https://www.atlassian.com/git/tutorials/comparing-workflows

## Git lfs installation
```bash
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
```
* OR

* Navigate to git-lfs.github.com and click Download.
* locate and unzip the downloaded file.
* then CD and run:
```bash
sudo bash install.sh
git lfs install # verify installation
git lfs track "*.bin"
git lfs track
```
* How to remove/delete a large file from commit history in Git repository? https://stackoverflow.com/questions/2100907/how-to-remove-delete-a-large-file-from-commit-history-in-git-repository


* Duplicating a repository: https://help.github.com/articles/duplicating-a-repository/

## Git Deployments
* https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys
* https://developer.github.com/v3/guides/delivering-deployments/
* https://developer.github.com/v3/repos/deployments/

## MISC MISC MISC MISC

> warning: adding embedded git repository: SRILM/eval2<br />
hint: You've added another git repository inside your current repository.<br />
hint: Clones of the outer repository will not contain the contents of<br />
hint: the embedded repository and will not know how to obtain it.<br />
hint: If you meant to add a submodule, use:<br />
hint: <br />
hint: 	git submodule add <url> SRILM/eval2<br />
hint: <br />
hint: If you added this path by mistake, you can remove it from the<br />
hint: index with:<br />
hint: <br />
hint: 	git rm --cached SRILM/eval2<br />
hint: <br />
hint: See "git help submodule" for more information.<br />

* to force add files even if they are ignored
```bash
git add -f directory/*

  gcc -c -fpic cylinder.c cylinder_wrap.c -I/home/meldesouki/python/include -I/home/meldesouki/python/include/python2.5
```

## READING
* https://nvie.com/posts/a-successful-git-branching-model/?fbclid=IwAR2xUD8mNkug3kk70SOT8undMw-J_sA5wqlZo3gY3HACTnDCIuFcxxLyW7Q
* https://developer.github.com/
<br />
  
The legal side of github
  
* https://opensource.guide/legal/#which-open-source-license-is-appropriate-for-my-project
* https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow?fbclid=IwAR3cCb3_wwKY-kSSuOrDh3ae-8pmeW1fEIX96jmu0ag3RZCbKhQcQWM1gVU

## Contributing
* https://help.github.com/articles/about-pull-requests/
<br />
When contributing, please follow these steps:

* Clone the repo and make your changes.
* Make sure your code has test cases written against it.
* Make sure all the tests pass.
* Lint your code with Flake8.
* Add your name to the list of contributers.
* Submit a Pull Request.

### Open Source Guides
* https://opensource.guide/
* https://guides.github.com/activities/hello-world/
