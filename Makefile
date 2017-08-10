SRC=intro.tex v2c.tex bmc.tex paths.tex ubmc.tex concl.tex methodology.tex related_work.tex equivalence.tex
TARGET=paper
BIB=biblio.bib

all: ${TARGET}.pdf

${TARGET}.dvi: ${TARGET}.tex ${BIB} ${SRC}
	pdflatex ${TARGET}.tex
	pdflatex ${TARGET}.tex
	bibtex ${TARGET}.aux
	pdflatex ${TARGET}.tex
	pdflatex ${TARGET}.tex

${TARGET}.ps: ${TARGET}.dvi 
	dvips -t a4 -Ppdf -G0 -o ${TARGET}.ps ${TARGET}.dvi 

${TARGET}.pdf: ${TARGET}.ps 
	ps2pdf -sPAPERSIZE=a4  -dCompatibilityLevel=1.4 -dSubsetFonts=true -dEmbedAllFonts=true  -dPDFSETTINGS=/prepress ${TARGET}.ps ${TARGET}.pdf

clean:
	rm -f ${TARGET}.{log,aux,dvi,bbl,blg,toc,ps,pdf,out,fls,fdb_latexmk} 

purge: clean
	rm -f ${TARGET}.pdf

PHONY : all clean purge
