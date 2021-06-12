#!/bin/bash
#replace string
#< ss $2 $3 >
#[ old new ]

set +e

case $1 in

  d)
    find . -type d -name "*$2*" | rename "s|$2|$3|g"
  ;;

  f)
    find . -type f -name "*$2*" | rename "s|$2|$3|g"
  ;;

  s)
    grep -rl "$2" . | xargs sed -i "" -e "s|$2|$3|g"
  ;;

  df)
    find . -type d -name "*$2*" | rename "s|$2|$3|g"
    find . -type f -name "*$2*" | rename "s|$2|$3|g"
  ;;

  dfs)
    find . -type d -name "*$2*" | rename "s|$2|$3|g"
    find . -type f -name "*$2*" | rename "s|$2|$3|g"
    grep -rl "$2" . | xargs sed -i "" -e "s|$2|$3|g"
  ;;

  *)
    echo "[(d)irectory (f)ile (s)tring]"
  ;;

esac
