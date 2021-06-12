#!/bin/bash
#sync mac & poulton
#< bb $1 >
#[ poud pou macd mac ]

set +e

ex="--exclude ".DocumentRevisions-V100" --exclude ".DS_Store" --exclude ".fseventsd" --exclude ".Spotlight-V100" --exclude ".TemporaryItems" --exclude ".Trashes""

diskutil mount poulton

#rm -rf source-directory

if mount | grep -qs /Volumes/poulton; then

  case $1 in

    poud)
      echo -e "--delete MAC < POU"
      rsync -ravu --delete $ex /Volumes/poulton/dan/ ~/dan
    ;;

    pou)
      echo -e "MAC < POU"
      rsync -ravu $ex /Volumes/poulton/dan/ ~/dan
    ;;

    macd)
      echo -e "--delete MAC > POU"
      rsync -ravu --delete $ex ~/dan/ /Volumes/poulton/dan
    ;;

    mac)
      echo -e "MAC > POU"
      rsync -ravu $ex ~/dan/ /Volumes/poulton/dan
    ;;

    *)
      echo -e "to sync enter : < gg mac[d]/pou[d] | mac=mac pou=poulton d=del >"
      say "error"
    ;;

  esac

else echo -e "NO POULTON"
  say "no disk"

fi

diskutil umount poulton
say "ready"
