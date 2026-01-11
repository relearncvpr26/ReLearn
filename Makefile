PELICAN ?= pelican
PELICANOPTS ?=
PYTHON ?= python
SITEURL ?=
BASEDIR := $(CURDIR)
INPUTDIR := $(BASEDIR)/content
OUTPUTDIR := $(BASEDIR)/docs
CONFFILE := $(BASEDIR)/pelicanconf.py
PUBLISHCONF := $(BASEDIR)/publishconf.py

.PHONY: html help clean regenerate publish serve devserver stopserver

help:
	@echo "make html       -> Generate the site"
	@echo "make clean      -> Remove output directory"
	@echo "make regenerate -> Regenerate without deleting output"
	@echo "make publish    -> Generate site with publish settings"
	@echo "make serve      -> Serve output at http://localhost:8000"
	@echo "make devserver  -> Start autoreloading dev server"
	@echo "make stopserver -> Stop dev server"

html:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

clean:
	rm -rf $(OUTPUTDIR)

regenerate:
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

publish:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

serve:
	$(PYTHON) -m http.server --directory $(OUTPUTDIR)

devserver:
	$(PELICAN) -lr $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

stopserver:
	@pkill -f "pelican.server" || true
