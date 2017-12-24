BASEDIR=$(CURDIR)
DOCDIR=$(BASEDIR)/docs

install:
	pip install mkdocs==0.16.3
	pip install mkdocs-material==1.12.2

preview:
	mkdocs serve

deploy:
	mkdocs gh-deploy --clean
