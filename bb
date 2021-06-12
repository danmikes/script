#!/bin/bash
#sync porsche & poulton
#< aa $1 >
#[ pord por poud pou ]

set +e

ex="--exclude ".DocumentRevisions-V100" --exclude ".DS_Store" --exclude ".fseventsd" --exclude ".Spotlight-V100" --exclude ".TemporaryItems" --exclude ".Trashes" --exclude "/Volumes/porsche/Backups.backupdb" --exclude "/Volumes/poulton/Backups.backupdb" --exclude "/Volumes/poulton/Movies""

diskutil mount porsche
diskutil mount poulton

#rm -rf source-directory

if [ "mount | grep "/Volumes/porsche"" ] && [ "mount | grep "/Volumes/poulton"" ]; then

  case $1 in

    pord)
      echo -e "--delete POR > POU"
      rsync -ravu --delete $ex /Volumes/porsche/ /Volumes/poulton
    ;;

    por)
    ;;
      echo -e "POR > POU"
      rsync -ravu $ex /Volumes/porsche/ /Volumes/poulton

    poud)
      echo -e "--delete POR < POU"
      rsync -ravu --delete /Volumes/poulton/ /Volumes/porsche
    ;;

    pou)
      echo -e "POR < POU"
      rsync -ravu $ex /Volumes/poulton/ /Volumes/porsche
    ;;

    *)
      echo -e "to sync enter : < gg por[d]/pou[d] | por=porsche pou=poulton d=del >"
      say "error"
    ;;

  esac

else echo -e "NO PORSCHE/POULTON"
  say "no disc"

fi

diskutil umount porsche
diskutil umount poulton
say "ready"
