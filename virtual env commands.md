
> IMPORTANT NOTE
>
> Pipenv is more for projects and apps that you (or your company) run directly, that's where the deterministic locking system comes into play. If you want to provide a way for others to install it, then you should have dependencies as ranges of compatible versions, instead of pinpointed (locked) versions. Pipenv with its Pipfile "replace" requirements.txt and venv. But not the tools for distribution.
>
> If you want an alternative to setup.py for distribution, you can try one of the projects that use pyproject.toml. Mainly Flit and Poetry.
Flit "replaces" setuptools (setup.py), you don't need a setup.py anymore. Only the (for me, easier to maintain) pyproject.toml.
Poetry "replaces" setuptools (setup.py) and requirements.txt (and also Pipenv) at the same time. It puts everything in the same file. But the versions thing still applies. It's just in the same file now.
> 
> I created a couple packages with setuptools (setup.py) and it felt quite messy. I recently started using Flit and I'm loving it. It does a lot of the things you would have to hack around "by default". Try it once, check the tutorial, in 5 minutes you have a package ready, published and installable. That combination, Pipenv for development and Flit for releasing is what I'm using in FastAPI: https://github.com/tiangolo/fastapi
Poetry has a lot of fans too. It seems that PyPA (the guys that run PyPI) is not endorsing Poetry for differences in their ideas of "how things should be done", but it seems that would be a perfectly good alternative too.


# Pyenv
### UPDATE: use [pyenv Installer](https://github.com/pyenv/pyenv-installer) as following:
```bash
curl https://pyenv.run | bash
exec $SHELL

# Put the following 3 lines in .bashrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# For updating
pyenv update  # If you installed pyenv via [pyenv installer](https://github.com/pyenv/pyenv-installer):

# To uninstall
rm -fr ~/.pyenv # then remove the 3 line from .bashrc
```
[**Install Python build dependencies**](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)
  before attempting to install a new Python version.

### The manual way

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

exec "$SHELL"

sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# If you wanted to see all the available CPython 3.6 through 3.8, you can do this:
pyenv install --list | grep " 3\.[678]"

pyenv install 3.7.6
```

> NOTE: You can activate multiple versions at the same time, including multiple versions of Python2 or Python3 simultaneously. 
This allows for parallel usage of Python2 and Python3, and is required with tools like tox. For example, to set your path to first 
use your system Python and Python3 (set to 2.7.9 and 3.4.2 in this example), but also have Python 3.3.6, 3.2, and 2.5 available on 
your PATH, one would first pyenv install the missing versions, then set pyenv global system 3.3.6 3.2 2.5. At this point, one should 
be able to find the full executable path to each of these using pyenv which, 
e.g. pyenv which python2.5 (should display $(pyenv root)/versions/2.5/bin/python2.5), or 
pyenv which python3.4 (should display path to system Python3). You can also specify multiple versions in a .python-version file, 
separated by newlines. Lines starting with a # are ignored.

```bash
pyenv global 3.7.6
pyenv global 3.7.12 3.8.11 3.9.9 3.10.0

# The 'versions' command displays all currently installed Python versions:
pyenv versions

# To show the current active version, you can use the following command:
pyenv version

# For updating
cd $(pyenv root) && git pull
```

Sets  a  local  application-specific  Python  version  by writing the version name to a .python-version file in the current directory. This version overrides the global version
```bash
pyenv local 3.6.15
```

# Virtual Enivronment for Python

- Poetry
- Pipenv
- Anaconda
- virtualenv

## Poetry
You should commit the poetry.lock file to your project repo so that all people working on the project are locked to the same versions of dependencies (more below).

### Preparing the system

> <picture>
>   <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/Mqxx/GitHub-Markdown/main/blockquotes/badge/light-theme/info.svg">
>   <img alt="Info" src="https://raw.githubusercontent.com/Mqxx/GitHub-Markdown/main/blockquotes/badge/dark-theme/info.svg">
> </picture><br>
> 
> If you use a tool like pyenv to manage different Python versions, you can set the experimental `virtualenvs.prefer-active-python` option to `true`. Poetry will then try to find the current python of your shell.
You can also set environment Variable `export POETRY_VIRTUALENVS_PREFER_ACTIVE_PYTHON=true`:
> >```bash
> > poetry config virtualenvs.prefer-active-python true
> > ....
> > pyenv install 3.9.8
> > pyenv local 3.9.8  # Activate Python 3.9 for the current project
> > poetry install
> > ```

- Install Poetry, run
```bash
curl -sSL https://install.python-poetry.org | sudo POETRY_HOME=/etc/poetry python3 -
```

- Expose poetry to you prompt by adding to `~/.bashrc` the following:
```bash
export PATH="/etc/poetry/bin:$PATH"
```

By default, Poetry creates a virtual environment in `{cache-dir}/virtualenvs`. You can change the cache-dir value by editing the Poetry configuration. Additionally, you can use the `virtualenvs.in-project` configuration variable to create virtual environments within your project directory.

Setting Environment Variable:
```bash
poetry config virtualenvs.in-project true

# or adding the following to .bashrc
export POETRY_VIRTUALENVS_IN_PROJECT=true
```

- For autocompletion run the following:
```bash
poetry completions bash >> ~/.bash_completion
```

### Creating Projects

- create a new project,
```bash
poetry new [--src] try-poetry [--name my_package]
```
The `--src` flag put the created package under directory `src/`

- Poetrising an Existing Project
```bash
Poetry init
```

### Environment

You can list all the virtual environments associated with the current project with the `env list` command:
```bash
poetry env list
```

You can find out where the current project’s virtual environment (if there is one) is stored with
```bash
poetry env info --path
```

Create a new env
```bash
poetry env use python3.11
```

With the install command, Poetry checks your pyproject.toml file for dependencies then resolves and installs them.
```bash
poetry install --no-root [--only-root | --without dev docs] [--sync]
```
- If you want to exclude one or more dependency groups for the installation, you can use the `--without` option.
- If you want to synchronize your environment – and ensure it matches the lock file – use the `--sync` option.
- **N.B: Besides pytest and its requirements, Poetry also installs the project itself (similar to `pip install -e .`). This way, you can import your package into your tests right away. To only install the project itself with no dependencies, use the `--only-root` flag. If you want to skip this installation, use the `--no-root` option.**

- The easiest way to activate the virtual environment is to create a nested shell with `poetry shell`.
- To deactivate the virtual environment and exit this new shell type `exit`. To deactivate the virtual environment without leaving the shell use `deactivate`.



## Pipenv 

```bash
# Installing pipenv 
pip install --user pipenv # sudo -H pip install -U pipenv

# If you don’t even have pip installed, you can use this crude installation method, which will bootstrap your whole system:
curl https://raw.githubusercontent.com/pypa/pipenv/master/get-pipenv.py | python

# To store your virtualenv inside your project directory
echo 'export PIPENV_VENV_IN_PROJECT=1' >> ~/.bashrc

export PIPENV_CACHE_DIR=""

# To create or update existed ENV for "pipfile"
# Be ware of this issue https://github.com/pypa/pipenv/issues/1914#issuecomment-429515521 and use --skip-lock
pipenv install [--python 3.8]
pipenv  install -v --skip-lock allennlp==0.9.0 --python 3.7

# For production 
pipenv install --ignore-pipfile

# To get the DIR of the virtual env
pipenv --venv

# To install packages from an old requirements.txt file this will create an ENV if does not exist
pipenv install -r ../the/path/to/your/requirements.txt

# To delete an ENV 
pipenv --rm

# To activate the environment
pipenv shell

# To deactivate an environment
exit

# To install a package (use the --dev flag only if you want packages installed only for dev environment)
pipenv install <package_name> [--dev]

pipenv uninstall <package_name> [--dev]

# To install packages from an old requirements.txt file
pipenv install -r ../the/path/to/your/requirements.txt

# To run a python script without activating the virtual environment.
pipenv run python <my_script.py>

# To run the interactive python of an ENV without activating it
pipenv run python

# To update pipfile.lock
pipenv lock

# To generate requirements.txt file:
pipenv lock -r

# The --keep-outdated flag ensures pipenv doesn’t try to update dependencies if the lockfile is out of sync. 
# This scheme ensures that your Dockerfile doesn’t need to know anything about pipenv. This does require you 
# to remember to regenerate requirements.txt every time you update Pipfile.lock.
pipenv lock -r --keep-outdated > requirements.txt

# passing --dev will include both the default and development dependencies
pipenv lock -r [--dev|--dev-only]

```
Dockerfile

> FROM python:3.9
RUN pip install pipenv
COPY Pipfile* /tmp
RUN cd /tmp && pipenv lock --keep-outdated --requirements > requirements.txt
RUN pip install -r /tmp/requirements.txt
COPY . /tmp/myapp
RUN pip install /tmp/myapp
CMD flask run exampleapp:app



```


# Create .env file for your environement variables
#SECRET_KEY="fgfm4534kfdgdklnml5498"


# if you already have an old virtual env created using `virtualenv` command and you want to use it with pipenv, do the 
# following:
# 1) Activate the old environment, then 
# 2) run sh`pipenv install`

# It’s worth adding the Pipfiles to your Git repository, so that if another user were to clone the repository, all they would
# have to do is install Pipenv on their system and then type,
pipenv install

###  UPDATE: Using pipx (beware I only tried this with auto installer from pyenv-installer)
#####################################################################################
pip install --user pipx
pipx install pipenv


######################################################
################ virtualenv ##########################
######################################################

# to install virtualenv
pip install virtualenv

# to list all the packages installed inside the env that you are in
pip list

# try to put all your environments in one directory

# to create an environment run the following command:
virtualenv <env_name>

# to activate the environment just run 
source <env_name>/bin/activate


virtualenv venv --python=python2.7

# Thanks to a comment, this only works if you have python2.7 installed at the system level (e.g. /usr/bin/python2.7).
# Otherwise, if you are using homebrew you can use the path to give you what you want.
virtualenv venv --python=/usr/local/bin/python
virtualenv venv --python=/usr/local/bin/python3

# Ultimately condensing to:
virtualenv venv -p `which python`
virtualenv venv -p `which python3`conda env create
virtualenv -p `which python2.6` <path/to/new/virtualenv>
virtualenv -p python3 <myenvname>

# For Python3.6, the below pyvenv script is deprecated. 
pyvenv /path/to/new/virtual/environment
# Instead, it is suggested that you create the virtual environment with the following command:
# [SOF] https://stackoverflow.com/questions/1534210/use-different-python-version-with-virtualenv/39713544#39713544
python3 -m venv <myenvname>
#or 
python 3 -m venv <myenvname>

# to export the environemnt 
pip freeze --local > requirements.txt

# The requirements.txt file just contains the python packages installed in the env but it does not 
# specify the python version, so
# To use the requirements.txt you need first to create env as mentioned above and then use the followinf command to 
# reinstall the packages in the env.
pip install -r requirements.txt

# close env by 
deactivate

# To delete an env, you need just deactivated and then run the following:
rm -rf <myenvname>

################
### Anaconda ###
################
# Please check https://conda.io/docs/user-guide/tasks/manage-environments.html for more details
# conda is used to install non-python packages and dependencies 
conda --help
conda list

# conda is also used to manage your environment too
# new env using conda

conda create --name <env_name> <[list of package to be installed with the env]>

# activate env
source activate <env_name> 
source deactivate <env_name>

# save the environment using the following command
conda env export > environment.yml

# if you want to recreate the environment run the following
# it requires that you are in the same directory of file environment.yml and the name of the file should either has 
# the name of "environment.yml" or "environment.yaml"
conda env create [-f <filename>]


# To delete an environement just run
conda remove --name <env_name> --all

#####################################################################
#####################################################################

# You have chosen to not have conda modify your shell scripts at all. 
# To activate conda's base environment in your current shell session:
eval "$(/home/disooqi/miniconda2/bin/conda shell.YOUR_SHELL_NAME hook)"
# To install conda's shell functions for easier access, first activate, then:
conda init
# If you'd prefer that conda's base environment not be activated on startup,  
# set the auto_activate_base parameter to false:  
conda config --set auto_activate_base false
# Thank you for installing Miniconda2! 


######################################################################
Using venv module
######################################################################
In Windows
----------
# Create environemnt
python -m venv env

# Activate environment
env\Scripts\activate.bat

# Update pip 
python -m pip install --upgrade pip

# Create requirements.txt file
pip freeze  # copy the output from the screen and past it into a file

# Deactivate our environment 
deactivate

# delete our environment 
rmdir env /s
```
