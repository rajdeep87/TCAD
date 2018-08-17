# Standard Makefile for US paper size.

TARGET=paper
BIB=biblio

all: clean ${TARGET}.pdf

${TARGET}.dvi: ${TARGET}.tex ${BIB}.bib
	latex ${TARGET}.tex
	bibtex ${TARGET}
	latex ${TARGET}.tex
	latex ${TARGET}.tex

${TARGET}.ps: ${TARGET}.dvi 
	dvips -t letter -Ppdf -G0 -o ${TARGET}.ps ${TARGET}.dvi 

${TARGET}.pdf: ${TARGET}.ps 
	ps2pdf -sPAPERSIZE=letter  -dCompatibilityLevel=1.2 -dSubsetFonts=true -dEmbedAllFonts=true  -dPDFSETTINGS=/prepress ${TARGET}.ps ${TARGET}.pdf

clean:
	rm -f ${TARGET}.{log,aux,dvi,bbl,blg,toc,ps,pdf} 

purge: clean
	rm -f ${TARGET}.pdf

PHONY : all clean purge
