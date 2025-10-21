mkdir perf_record_`date +%Y%m%d%H%M%S`
cd perf_record_`date +%Y%m%d%H%M%S`

PERF="/your/path/linux-src/tools/perf/perf"

# Permission error mapping pages.
# Consider increasing /proc/sys/kernel/perf_event_mlock_kb,
# or try again with a smaller value of -m/--mmap_pages.
# (current value: 4294967295,0)
#
# echo 2048 > /proc/sys/kernel/perf_event_mlock_kb

delay=6
while (true)
do
  # perf record `-k 1` make perf inject -i perf.data --jit -o perf.data.jitted work.
  # java -agentpath:/your/path/linux-src/tools/perf/libperf-jvmti.so
  # reference:
  # 1. perf: add support for profiling jitted code
  # https://lwn.net/Articles/638566/
  # 2. Inspecting OpenJ9 performance with perf on Linux – JIT Compiled Methods
  # https://blog.openj9.org/2019/07/18/inspecting-openj9-performance-with-perf-on-linux-jit-compiled-methods/
  $PERF record -k 1 -e cycles -p $1 -o perf_`date +%Y%m%d%H%M%S`.data sleep $delay &
  echo perf_`date +%Y%m%d%H%M%S`.data
  sleep $delay
done
