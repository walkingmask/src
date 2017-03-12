#!/bin/sh

# ks command
# 2016/01/11(Mon)
# walkingmask
# ls joke command

trap '' INT
# var
ch="KAAAAAAAAAAAAAAAAAA m9(^q^)9m AAAAAAAAAAAAAAAAASU!!"
column=`tput cols`
char_num=${#ch}

# padding
for i in `seq $column`
do
ch=" $ch "
done

# print
for i in `seq $((column+char_num))`
do
  printf "\r${ch:$i:$column}"
  sleep 0.01
done
afplay $HOME/Music/bell.mp3 &
echo "\r|q^)9m KASU!!"
trap - INT 
