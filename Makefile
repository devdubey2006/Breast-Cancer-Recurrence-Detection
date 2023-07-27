.PHONY: venv

#### Build virtual environment and install packages
venv: venv/bin/activate ## Create virtual environment and download required packages from requirements.txt
venv/bin/activate: requirements.txt
	python -m venv venv
	. venv/bin/activate; pip install --upgrade pip; pip install -r requirements.txt; pip install "git+https://github.com/03bennej/ei-python.git"; pip install -e .;

.PHONY: data

#downloading data and retriever and whatnot
data: data/bin/activate
data/bin/activate: requirements.txt
	. data/bin/activate; wget https://cbiit-download.nci.nih.gov/nbia/releases/ForTCIA/NBIADataRetriever_4.3/NBIADataRetriever-4.3-1.x86_64.rpm; sudo yum -y install NBIADataRetriever-4.4-1.x86_64.rpm; cat Duke-Breast-Cancer-MRI_v2_20220609.tcia;  /opt/nbia-data-retriever/nbia-data-retriever  --cli manifest-xxx.tcia -d /data/images
