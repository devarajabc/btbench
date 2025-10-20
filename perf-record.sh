mkdir perf_record_`date +%Y%m%d%H%M%S`
cd perf_record_`date +%Y%m%d%H%M%S`

# Permission error mapping pages.
# Consider increasing /proc/sys/kernel/perf_event_mlock_kb,
# or try again with a smaller value of -m/--mmap_pages.
# (current value: 4294967295,0)
#
# echo 2048 > /proc/sys/kernel/perf_event_mlock_kb

delay=6
while (true)
do
  perf record -e cycles -p $1 -o perf_`date +%Y%m%d%H%M%S`.data sleep $delay &
  echo perf_`date +%Y%m%d%H%M%S`.data
  sleep $delay
done
