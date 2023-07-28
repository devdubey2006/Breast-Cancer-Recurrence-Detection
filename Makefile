.PHONY: venv data

#### Build virtual environment and install packages
venv: venv/bin/activate ## Create virtual environment and download required packages from requirements.txt
venv/bin/activate: requirements.txt
	python -m venv venv
	. venv/bin/activate; pip install --upgrade pip; pip install -r requirements.txt; pip install "git+https://github.com/03bennej/ei-python.git"; pip install -e .;

data:
	wget -P data/raw https://wiki.cancerimagingarchive.net/download/attachments/70226903/Clinical_and_Other_Features.xlsx?api=v2
	wget -P data/raw https://wiki.cancerimagingarchive.net/download/attachments/70226903/Breast-Cancer-MRI-filepath_filename-mapping.xlsx?api=v2 
	wget -P data/raw https://wiki.cancerimagingarchive.net/download/attachments/70226903/Imaging_Features.xlsx?api=v2 
	wget -P data/raw https://wiki.cancerimagingarchive.net/download/attachments/70226903/Annotation_Boxes.xlsx?api=v2 
	mv data/raw/Clinical_and_Other_Features.xlsx?api=v2 data/raw/Clinical_and_Other_Features.xlsx
	mv data/raw/Breast-Cancer-MRI-filepath_filename-mapping.xlsx?api=v2 data/raw/Breast-Cancer-MRI-filepath_filename-mapping.xlsx
	mv data/raw/Imaging_Features.xlsx?api=v2 data/raw/Imaging_Features.xlsx
	mv data/raw/Annotation_Boxes.xlsx?api=v2 data/raw/Annotation_Boxes.xlsx