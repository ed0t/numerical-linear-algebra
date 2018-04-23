current_dir = "handsonml"
python_version  = 3.6.4

pyenv:
	@pyenv install -s $(python_version)
	@pyenv virtualenvs | grep "$(python_version)/envs/$(current_dir)" || pyenv virtualenv $(python_version) $(current_dir)
	@echo $(python_version)/envs/$(current_dir) > .python-version

isntall-dependencies:
	@${HOME}/.pyenv/versions/$(python_version)/envs/$(current_dir)/bin/pip install .

pyenv-uninstall:
	@rm .python-version
	@pyenv uninstall -f $(current_dir)

virtualenv-create:
	virtualenv --system-site-packages -p python3 p3

activate:
	. p3/bin/activate

jupiter:
	jupyter notebook

test:
	echo $(current_dir)
