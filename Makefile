# Makefile for building paper.tex
# Usage:
#   make          -> build paper.pdf
#   make clean    -> remove auxiliary files
#   make distclean-> remove auxiliary files and the PDF

TEX  = paper.tex
NAME = paper
PDF  = $(NAME).pdf

# Default engine; override with: make ENGINE=xelatex
ENGINE ?= pdflatex

.PHONY: all pdf clean distclean view

all: pdf

pdf: $(PDF)

$(PDF): $(TEX) references.bib
	$(ENGINE) -interaction=nonstopmode $(NAME)
	bibtex $(NAME)
	$(ENGINE) -interaction=nonstopmode $(NAME)
	$(ENGINE) -interaction=nonstopmode $(NAME)

clean:
	rm -f $(NAME).aux $(NAME).log $(NAME).bbl $(NAME).blg \
	      $(NAME).out $(NAME).toc $(NAME).lof $(NAME).lot \
	      $(NAME).fls $(NAME).fdb_latexmk $(NAME).synctex.gz

distclean: clean
	rm -f $(PDF)
