PERF="perf stat -e cpu-cycles -e instructions" 

mkdir perf_stat_`date +%Y%m%d%H%M%S`
cd perf_stat_`date +%Y%m%d%H%M%S`

rc=0
while [[ $rc == 0 ]]
do
  out=$($PERF -p $1 sleep 1 2>&1|tee perf_`date +%Y%m%d%H%M%S`.log)
  if [ `echo $out | grep -c "Usage" ` -gt 0 ]
  then
    rc=-1
  fi
  echo perf_`date +%Y%m%d%H%M%S`.log;
done
