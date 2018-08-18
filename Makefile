# Standard Makefile for US paper size. 

TARGET=paper
BIB=biblio

all: ${TARGET}.pdf

${TARGET}.dvi: ${TARGET}.tex symbols.tex intro.tex notation.tex background.tex example.tex v2c.tex equivalence.tex experiment.tex related_work.tex concl.tex ${BIB}.bib plot-runtimes.tex solver-runtimes.tex
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



