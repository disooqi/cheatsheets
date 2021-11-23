
#########################################################
#########################  TOX  #########################
#########################################################
# Prerequisites
1. Pyenv is installed and all python vers are globalized (e.g. pyenv global 3.7.12 3.8.11 3.9.9 3.10.0) or use deadsnakes 
2. install tox (pip install tox) no virtual environment needed.
3. Create tox.ini

# How to run TOX
$ tox

# to prevent tox from failing tests for missing interpreters: {config,true,false} choice (default: config)
$ tox -s true

# to run only on Python 3.10
$ tox -e py27 

# -- means "hey tox don't handle the rest of these args"
$ tox -e py310 -- tests -k test_cal.py
$ tox -e py310 -- tests -k cal

# To intractively work faster with tox do the following:
# this will create an env outside '.tox/' and install your library (a.k.a package) in an editable mode
$ tox --devenv <env-name>
# OR 
$ tox -e py310 --devenv .venv


#########################################################
###### Strip down the PyCharm UI into "TDD Mode"  #######
### source: https://www.youtube.com/watch?v=kwj6Hk1kJYU #
#########################################################

# Type Ctrl+Shift+A (Wins and Linux),
1) Type "View | Appearance: Tool Window Bars" to remove Tool Window Bars
2) Type "View | Appearance: Navigation Bar" to remove Navigation Bar
3) Type "View | Appearance: Main Menu" to turn off Main Menu
4) Type "ta pl non" and turn ON "Tab Placement | None" to turn off Tabs
5) Type "Window | Editor Tabs | Split Right" or "sp ri" and press OK to split screen vertically



# The following will set up a symlink to your code in site-packages, allowing you to edit your code while your tests run against it as if it were installed.
# -e : Editable Dependencies; for setting up your project in development mode lets you avoid having to reinstall every time you want to run your tests, and is less brittle than mucking about with sys.path to point your tests at local code.
# --dev : to prevent the project to be installed in production 
# .[tests] : consider installing the `tests` part under `extras_require` in setup.py file. It is useful in case you want to install packages not in Pipfile
pipenv install --dev -e .[tests] 

# New Test 
Ctrl+Shift+T

# To change file
Ctrl+E

# Jump to navigation bar
ALT+home
