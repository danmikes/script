#!/bin/bash
#compile latex document
#< ll $1 $2 >
#[ ... (htm) (bib) ]

set +e

latex $1
latex $1

#check if $1!=null

case $2 in

  bash)
    pdflatex -synctex=1 -interaction=nonstopmode --shell-escape $1.tex
    open $1
  ;;

  book)
#    makeindex $1
    biber $1
    pdflatex $1
    open $1.pdf
  ;;

  htm)
    htlatex $1
    open $1.html
  ;;

  hbib)
    biber $1
    htlatex $1
    open $1.html
  ;;

  pbib)
    biber $1
    pdflatex $1
    open $1.pdf
  ;;

  pdf)
    pdflatex $1
    open $1.pdf
  ;;

  *)
    biber $1
    pdflatex $1
    open $1.pdf
  ;;

esac

for x in .aux .acn .aux .bbl .bcf .blg -blx.bib .dvi .glo .gls .glsdefs .idx .ilg .ind .ist .nlo .maf .mtc* .nav .ps .out .run.xml .snm .spl .toc .vrb
  do
    rm $1$x
  done

#rm *.log

