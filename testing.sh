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




# Editable Dependencies (e.g. -e . )
# note that [tests] part will install the extras in setup.py
pipenv install --dev -e .[tests] 

# New Test 
Ctrl+Shift+T

# To change file
Ctrl+E

# Jump to navigation bar
ALT+home
