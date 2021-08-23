#!/bin/sh

(for i in {1..50000}
do  
  ifdata -bops eth0
done) &> info_ifdata_bops.txt
