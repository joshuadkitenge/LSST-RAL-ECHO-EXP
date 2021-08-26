source cachedrop.sh
source info_iostat.sh & 
PID1="$!"
source info_cpu_mem.sh & 
PID2="$!"
source info_ifdata_bops.sh & 
PID3="$!"
source info_ifdata_bips.sh & 
PID4="$!"
source gen.sh 
sleep 10
pkill -P $PID1
pkill -P $PID2
pkill -P $PID3
pkill -P $PID4
