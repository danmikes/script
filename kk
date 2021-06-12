#!/bin/bash
#update cv
#< kk $1 >
#[ geo hdr ite itn ]

set +e

case $1 in

  cve)
    cd ~/dan/cv
    . ll cven pdf
  ;;

  cvn)
    cd ~/dan/cv
    . ll cvnl pdf
  ;;

  cvg)
    . ii
    cd ~/dan/cv
    . ll cv pbib
  ;;

  hdr)
    . ii
    cd ~/dan/pub/tex/boo/mikes2015e
    . ll mikes2015e book
  ;;

  *)
    echo -e "kk [ boo cve cvg cvn ]"
  ;;

esac
