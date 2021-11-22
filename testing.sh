#########################################################
###### Strip down the PyCharm UI into "TDD Mode"  #######
### source: https://www.youtube.com/watch?v=kwj6Hk1kJYU
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
# note that [tests] part will install the extras in setup.py
pipenv install --dev -e .[tests] 

# New Test 
Ctrl+Shift+T

# To change file
Ctrl+E

# Jump to navigation bar
ALT+home
