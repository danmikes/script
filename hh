#!/bin/bash
#find uri
#< gg $1 >
#[ doi ]

set +e

head="location.href='"
foot="?download=true'"
out=out.xml

curl -s 'https://sci-hub.tf/'$1 > $out
string="$(grep -Irs $head.*$foot $out)"
#x=$(curl -s 'https://sci-hub.tf/'$1)
#string="$(grep -Irs $head.*$foot $x)"
string="${string#*$head}"
string="${string%$foot*}"
rm $out

case $string in

  [\/.]*)
    string="http:$string"
    ;;
  
  *)
    ;;

esac

curl -LO $string
