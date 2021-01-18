#!/usr/bin/bash
echo ""
while [ true ]
do
    NOW=$(date +"%Y-%m-%d %T")
    head -n 1 /sys/class/thermal/thermal_zone0/temp | xargs -I{} awk "BEGIN {printf \"${NOW}: CPU temperature %.2f°C\n\", {}/1000}"
    sleep 5s
done
