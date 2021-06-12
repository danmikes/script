#!/bin/bash
# merge movie parts & subtitles
#< mm $1 >
#[ ... ]

set +e

cat $1_1.avi $1_2.avi > $1_0.avi
cat $1_1.srt $1_2.srt > $1.srt

mencoder -forceidx -oac copy -ovc copy $1_0.avi -o $1.avi

rm $1_?.avi
rm $1_?.srt
