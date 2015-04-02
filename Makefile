LATEX = xelatex
BIBTEX = bibtex
THESIS = Thesis
CORR = corrections

.PHONY: all
all: $(THESIS).pdf $(CORR).pdf

.PHONY: show
show: $(THESIS).pdf
	open $(THESIS).pdf

$(THESIS).pdf: $(THESIS).tex $(THESIS).bbl
	$(LATEX) $(THESIS).tex
	$(LATEX) $(THESIS).tex

$(THESIS).bbl: $(THESIS).tex $(THESIS).bib MyPublications.bib
	$(LATEX) $(THESIS).tex
	$(BIBTEX) -terse $(THESIS)
	$(BIBTEX) -terse MyPublications

.PHONY: corrections
corrections: $(CORR).pdf
	open $(CORR).pdf

$(CORR).pdf: $(CORR).tex
	$(LATEX) $(CORR).tex

.PHONY: clean
clean:
	find . -type f -name  '*.aux' -print0 | xargs -0 rm
	find . -type f -name  '*.bbl' -print0 | xargs -0 rm
	find . -type f -name  '*.blg' -print0 | xargs -0 rm
	find . -type f -name  '*.log' -print0 | xargs -0 rm
	find . -type f -name  '*.maf' -print0 | xargs -0 rm
	find . -type f -name  '*.mtc*' -print0 | xargs -0 rm
	find . -type f -name  '*.toc' -print0 | xargs -0 rm
	find . -type f -name  '*.out' -print0 | xargs -0 rm
