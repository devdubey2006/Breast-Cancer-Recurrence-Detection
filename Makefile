.PHONY: venv

#### Build virtual environment and install packages
venv: venv/bin/activate ## Create virtual environment and download required packages from requirements.txt
venv/bin/activate: requirements.txt
	python -m venv venv
	. venv/bin/activate; pip install --upgrade pip; pip install -r requirements.txt; pip install "git+https://github.com/03bennej/ei-python.git"; pip install -e .;