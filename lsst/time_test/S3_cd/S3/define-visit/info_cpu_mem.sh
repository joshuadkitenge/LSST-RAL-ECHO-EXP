#!/bin/sh

(for i in {1..7200}
do  
  ps -C python -o pid,cmd,%cpu,%mem,etime
  sleep 1
done) &> info_cpu_mem.txt
