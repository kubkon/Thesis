all:
	xelatex Thesis.tex
	bibtex -terse Thesis
	xelatex Thesis.tex
	xelatex Thesis.tex

full:
	xelatex Thesis.tex
	bibtex -terse MyPublications
	bibtex -terse Thesis
	xelatex Thesis.tex
	xelatex Thesis.tex

show: Thesis.pdf
	open Thesis.pdf

clean:
	find . -type f -name  '*.aux' -print0 | xargs -0 rm
	find . -type f -name  '*.bbl' -print0 | xargs -0 rm
	find . -type f -name  '*.blg' -print0 | xargs -0 rm
	find . -type f -name  '*.log' -print0 | xargs -0 rm
	find . -type f -name  '*.maf' -print0 | xargs -0 rm
	find . -type f -name  '*.mtc*' -print0 | xargs -0 rm
	find . -type f -name  '*.toc' -print0 | xargs -0 rm

