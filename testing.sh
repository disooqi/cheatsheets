#########################################################
###### Strip down the PyCharm UI into "TDD Mode"  #######
### source: https://www.youtube.com/watch?v=kwj6Hk1kJYU
#########################################################

# Remove Tool Window Bars
View > Appearance > Tool Window Bars

# Remove Navigation Bar
View > Appearance > Navigation Bar

# Turn of Tabs
1) Type Ctrl+Shift+A (Wins and Linux)
2) Select Actions tab, and type "ta pl non"
3) For action [Tab Placement | None], turn the button to be ON 

# Split screen Vertically
Window > Editor Tabs > Split Right

# Editable Dependencies (e.g. -e . )
# note that [tests] part will install the extras in setup.py
pipenv install --dev -e .[tests] 
