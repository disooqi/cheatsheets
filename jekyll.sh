#!/bin/sh
# https://jekyllrb.com/tutorials/home/
# https://scotch.io/tutorials/getting-started-with-jekyll-plus-a-free-bootstrap-3-starter-theme

# Install ruby
sudo apt-get install ruby-full

# Install ruby gem
sudo apt-get install gem

# Intall Jekyll
sudo gem install jekyll bundler

jekyll new .

# for the first time run
bundle exec jekyll serve



jekyll serve
