#!/bin/sh

(for i in {1..7200}
do  
  ifdata -bips eth0
  sleep 1
done) &> info_ifdata_bips.txt
