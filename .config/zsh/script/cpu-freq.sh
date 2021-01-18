#!/usr/bin/bash
echo ""
while [ true ]
do
    NOW=$(date +"%Y-%m-%d %T")
    cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq | xargs -I{} awk "BEGIN {printf \"${NOW}: CPU frequency %.0f MHz\n\", {}/1000}"
    sleep 5s
done
