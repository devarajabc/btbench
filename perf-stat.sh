
mkdir perf_stat_`date +%Y%m%d%H%M%S`
cd perf_stat_`date +%Y%m%d%H%M%S`

PERF="/your/path/linux-src/tools/perf/perf"

rc=0
while [[ $rc == 0 ]]
do
  # `--topdown` and PMU events are only available for x86,  find some equivalence for your architecture.
  # reference:
  # Arm Topdown methodology Stage 2: Microarchitecture analysis
  # * frontend bound
  # iTLB-load-misses
  # branch-misses
  # L1-icache-load-misses
  # L1-icache-prefetch-misses
  # * backend bound
  # dTLB-load-misses
  # dTLB-store-misses
  # dTLB-prefetch-misses
  # * bad speculation
  # branch-misses
  # * retiring
  # instructions
  out=$($PERF stat --topdown -e cpu-cycles -e instructions -p $1 sleep 3 2>&1|tee perf_`date +%Y%m%d%H%M%S`.log)
  if [ `echo $out | grep -c "Usage" ` -gt 0 ]
  then
    rc=-1
  fi
  echo perf_`date +%Y%m%d%H%M%S`.log;
done
