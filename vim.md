most of the stuff below is from the page http://www.yolinux.com/TUTORIALS/LinuxTutorialAdvanced_vi.html <br />
Also look at https://realpython.com/vim-and-python-a-match-made-in-heaven/ <br />
One-time set <br />

## install the following

```bash
apt-get install vim vim-common vim-gnome vim-gui-common vim-runtime
```

In file ~/.vimrc set the following to work with utf-8
```bash
set encoding=utf-8
set fileencoding=utf-8
```

https://www.youtube.com/watch?v=ER5JYFKkYDg&t=140s <br />
https://vim-adventures.com/ <br />
vimtutor <br />

## Navigation
```vim
hjkl 
w (or b)
e 
f+<new char> (or F+<new char>)

gg (or G)
44+G

0 (or $)

ctrl+o  # navigate to where you have been 
ctrl+i  # the opposite of the above command

```
## Delete
```vim
x
3x
dw
dd (10+dd)
d$ = D

```
## Replace
```vim
r+<new char>
ce
c$=C


%s/<old string>/<new string>/g
3,9s/<old string>/<new string>/g
s/<old string>/<new string>/gc
```
## Copy
```vim
yw
y$=Y # copy the cursor to the end of the sentence
yy  # copy entire sentence
```
## UNDO and REDO
```vim
u
ctrl+r
```

## Prantheses
```vim
%
```
## Search
```vim
/ # for forward search
? # for backword search
```

## Run bash commands
```vim
:!<command>
```
