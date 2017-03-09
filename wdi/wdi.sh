#!/usr/bin/env bash
set -eu

# wdi.sh
# 2016/12/19(月)
# walkingmask
# What day is?
# References
#  http://qiita.com/bsdhack/items/2884a232bf49dbd7988c

# check arguments
if [ $# -gt 1 ]; then
  echo "Usage: wdi [date(8)|date(4)|today|-t]" 1>&2
  exit 1
fi

# option
if [ $# -eq 0 ] || [ $1 = "today" ] || [ $1 = "-t" ]; then
  day=`date +"%Y%m%d"`
else
  day=$1
fi

# when only m&d is entered, then give the current year
if [ ${#day} -le 4 ]; then
  day=`date +"%Y"`$1
fi

# delete unnecessary characters
day=`echo $day | tr -d \"-/\"`

y=`echo $day | cut -c 1-4 | sed -e 's/^0*\([0-9]*\)$/\1/'`
m=`echo $day | cut -c 5-6 | sed -e 's/^0*\([0-9]*\)$/\1/'`
d=`echo $day | cut -c 7-8 | sed -e 's/^0*\([0-9]*\)$/\1/'`

# zeller's congruence
test $m -lt 3 && y=$(($y - 1)) && m=$(($m + 12))
w=`echo $(( (y + (y/4) - (y/100) + (y/400) + (13*m + 8)/5 + d) % 7 ))`

case $w in
  0 ) echo "Sun";;
  1 ) echo "Mon";;
  2 ) echo "Tue";;
  3 ) echo "Wed";;
  4 ) echo "Thu";;
  5 ) echo "Fri";;
  6 ) echo "Sat";;
esac

exit 0
