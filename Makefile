PIP="venv/bin/pip"
TOX="venv/bin/tox"
PYTHON="venv/bin/python"
TWINE="venv/bin/twine"

clean:
	@find . -name *.pyc -delete
	@rm -rf venv

virtualenv:
	test -d venv || virtualenv -p python3.6 venv
	$(PIP) install -U pip

test: virtualenv
	$(PIP) install -U tox
	$(TOX)

publish: virtualenv
	$(PIP) install -U setuptools wheel twine
	$(PYTHON) setup.py sdist bdist_wheel
	$(TWINE) upload dist/*
