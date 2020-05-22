#!/bin/sh
# https://jekyllrb.com/tutorials/home/
# https://scotch.io/tutorials/getting-started-with-jekyll-plus-a-free-bootstrap-3-starter-theme

# Jekyll Themes
http://jekyllthemes.org/page6/
https://thelehhman.com/
https://wowthemesnet.github.io/jekyll-theme-memoirs/ (I like the most)
https://bootstrapstarter.com/bootstrap-templates/jekyll-theme-memoirs/
https://hydejack.com/
https://github.com/alopez/alopez.github.com
http://jekyllthemes.org/themes/barber/
http://jekyllthemes.org/themes/helium-jekyll/
http://jekyllthemes.org/themes/xixia/
http://jekyllthemes.org/themes/hydeout/
https://jekyll.github.io/minima/

sudo apt-get remove --purge ruby-full
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv install 2.7.0
rbenv global 2.7.0
gem install bundler
rbenv rehash

# Intall Jekyll
sudo gem install jekyll bundler

jekyll new .

# for the first time run
bundle exec jekyll serve

bundle install

# set baseurl to empty when run locally
jekyll serve --watch --baseurl ""

