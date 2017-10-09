#!/usr/bin/env bash
#set -eu -o pipefail

# lan_lookup
# 2017/08/19(Sat)
# walkingmask
# Look up IP addresses and MAC addresses in LAN

function lan_lookup(){
  if [ $# -eq 0 ]; then
    for i in `seq 1 254`; do
      printf "192.168.0.$i\r"
      arp 192.168.0.$i | grep -v no
    done
  elif [ $# -eq 1 ] && [ "$1" = "-2" ]; then
    for j in `seq 0 254`; do
      for i in `seq 1 254`; do
        printf "192.168.$j.$i\r"
        arp 192.168.$j.$i | grep -v no
      done
    done
  else
    echo "Usage: lan_lookup [-2]"
  fi
}

lan_lookup $@
