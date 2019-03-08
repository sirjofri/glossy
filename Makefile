DESTDIR ?= $(shell kpsewhich -var-value=TEXMFHOME)
INSTALLDIR = $(DESTDIR)/tex/latex/glossy
DOCDIR = $(DESTDIR)/doc/latex/glossy

INCS = glossy.sty
DOCS = glossy.pdf
TARGETS = $(addprefix $(INSTALLDIR)/,$(INCS)) $(addprefix $(DOCDIR)/,$(DOCS))

all: glossy.sty glossy.pdf

glossy.sty: glossy.ins glossy.dtx
	@latex $<
	@echo " → Temp files created"

glossy.pdf: glossy.dtx
	@pdflatex $<
	@pdflatex $<
	@echo " → Documentation created"

install: $(INSTALLDIR) $(DOCDIR) $(TARGETS)
	@echo " → glossy installed to $(INSTALLDIR)"

$(INSTALLDIR) $(DOCDIR):
	@mkdir -p $@

$(INSTALLDIR)/%.sty: %.sty
	@cp $< $@
	@echo " → Installed $@"

$(DOCDIR)/%.pdf: %.pdf
	@cp $< $@
	@echo " → Installed $@"

uninstall:
	-@rm -Rf $(INSTALLDIR) $(DOCDIR)
	@echo " → Removed glossy package"

clean:
	-@rm \
	glossy.aux \
	glossy.glo \
	glossy.idx \
	glossy.log \
	glossy.sty \
	glossy.toc
	@echo " → Removed temp files"
