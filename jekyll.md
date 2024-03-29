* https://jekyllrb.com/tutorials/home/
* https://scotch.io/tutorials/getting-started-with-jekyll-plus-a-free-bootstrap-3-starter-theme
* https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04

I think the following:
* _rbenv_ is similar to _pyenv_
* _gem_ is similar to _pip_
* _bundler_ is similar to _virtualenv_

**Compatibility note:** rbenv is incompatible with RVM. Please make sure to fully uninstall RVM and remove any references to it from your shell initialization files before installing rbenv.

Installation of rbenv & Ruby 
=====================================
OPTION 1: using Package Managers (I tried it 1 time; [Not recommended] because all ruby versions are outdated)
---------------------------------
```bash
sudo apt install rbenv
rbenv init # Close your Terminal window and open a new one so your changes take effect.
# Verify that rbenv is properly set up using this rbenv-doctor script:
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
```
Don't forget to [install Ruby](https://github.com/rbenv/rbenv-installer#rbenv-installer) after installing rbenv

OPTION 2: (recommended) using rbenv-installer (I tried it 1 time)
---------
For a more automated install, you can use rbenv-installer. If you prefer a manual approach, follow the steps below.
https://github.com/rbenv/rbenv-installer#rbenv-installer

The `rbenv-installer` script idempotently installs or updates rbenv on your system.

```bash
# Run
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
# You'll want to ensure that `~/.rbenv/bin' is added to PATH. (same as pyenv)
# Close terminal and open a new one.
# Run `rbenv init' to view instructions on how to configure rbenv for your shell.
# Launch a new terminal window after editing shell configuration files.
# (Optional) Run the doctor command to verify the installation:
wget -q "https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor" -O- | bash
# To install Ruby:
rbenv install -l  # list latest stable versions

# You might need to install libyaml-dev if the build fails:
sudo apt-get update
sudo apt-get install libyaml-dev # Optional

rbenv install 3.0.3 # or whatever version you want
rbenv global 3.0.3
```

OPTION 3: Basic GitHub Checkout (I tried it 1 time)
--------------------------------

```sh
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
```

Working with Gems
==================
gem is similar to pip
WARNNING: you only need the following if you want to change the directory of gems. If you already used `rbenv`, the gems will be installed inside the
version of ruby you are using as global. Hint: I don't know yet how to make a local env for each project, and I don't know if there is a connection between that and bundler or not.

```bash
echo "gem: --no-document" > ~/.gemrc

echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc

# You can confirm where gems are being installed by using the home argument, like this:
gem env home
```

Working with Jekyll (if you already have an existing project, see the following subsection)
====================
```sh
gem install jekyll
jekyll new jekyll-website
cd jekyll-website/
bundle add webrick  # If you are using Ruby version 3.0.0 or higher
bundle exec jekyll serve --livereload
```
If you already having an existing project do the following:
---------
```sh
cd <project_dir>
bundle install
```

set baseurl to empty when run locally
`jekyll serve --watch --baseurl ""`

## Deploy Jekyll to Github pages
https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll


To use specific Theme  
-----------------------
references:
* https://learn.siteleaf.com/themes/gem-based-themes/
* https://jekyllrb.com/docs/themes/

Installation may vary depending on the theme, but typically involves two steps.
1) If the theme is a Gem-based theme, add it to the Gemfile e.g.
gem "minima", "~> 2.5"
gem "jekyll-theme-hydeout", "~> 3.3"
Then run 
`bundle install`
You may need to follow additional instructions, so make sure to review the theme’s documentation.

2) Next, enable theme theme in your site’s _config.yml file
theme: minima
To test your site locally, install and build your site using bundle exec:
bundle install
bundle exec jekyll serve

If you have the theme gem, you can (if you desire) run bundle update to update all gems in your project. Or you can 
run bundle update <THEME>, replacing <THEME> with the theme name, such as minima, to just update the theme gem. Any 
new files or updates the theme developer has made (such as to stylesheets or includes) will be pulled into your 
project automatically.

### Installing themes from GitHub repositories
Add the following to the Gemfile 
`gem 'minima', git: 'https://github.com/jekyll/minima.git'`
or
`gem 'minima', github: 'jekyll/minima'`


### Jekyll Themes
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

