#source cachedrop.sh
source info_iostat.sh & 
PID1="$!"
source info_cpu_mem.sh & 
PID2="$!"
source gen.sh 
sleep 10
pkill -P $PID1
pkill -P $PID2


