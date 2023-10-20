# Init your venv with:
#     python -m venv venv
#     ./venv/bin/pip install -r requirements.txt
VENV = ./venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip
TWINE = $(VENV)/bin/twine

# Target to run everything
all: clean upload

# Build the package
build:
	$(PYTHON) setup.py sdist bdist_wheel

# Upload to PyPI
upload: build
	$(TWINE) upload dist/*

# Clean up generated files
clean:
	rm -rf dist build *.egg-info

.PHONY: all venv lint test build upload clean
