SHELL=bash

SRC=intro.tex notation.tex background.tex v2c.tex bmc.tex paths.tex ubmc.tex concl.tex related_work.tex equivalence.tex experiment.tex 
TARGET=paper
BIB=biblio.bib

all: ${TARGET}.pdf

${TARGET}.pdf: ${TARGET}.tex ${BIB} ${SRC}
	pdflatex ${TARGET}.tex
	bibtex ${TARGET}.aux
	pdflatex ${TARGET}.tex
	pdflatex ${TARGET}.tex

clean:
	rm -f ${TARGET}.{log,aux,dvi,bbl,blg,toc,ps,pdf,out,fls,fdb_latexmk} 

purge: clean
	rm -f ${TARGET}.pdf

PHONY : all clean purge
