#!/bin/sh

(for i in {1..7200}
do  
  ifdata -bops eth0
done) &> info_ifdata_bops.txt
