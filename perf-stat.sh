
mkdir perf_stat_`date +%Y%m%d%H%M%S`
cd perf_stat_`date +%Y%m%d%H%M%S`

PERF="/your/path/linux-src/tools/perf/perf"

rc=0
while [[ $rc == 0 ]]
do
  # `--topdown` and PMU events are only available for x86,  find some equivalence for your architecture. 
  out=$($PERF stat --topdown -e cpu-cycles -e instructions -p $1 sleep 1 2>&1|tee perf_`date +%Y%m%d%H%M%S`.log)
  if [ `echo $out | grep -c "Usage" ` -gt 0 ]
  then
    rc=-1
  fi
  echo perf_`date +%Y%m%d%H%M%S`.log;
done
