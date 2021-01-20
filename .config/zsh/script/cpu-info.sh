#
# Get Raspberry Pi CPU temperature and frequency
#
echo " "
if [[ "$(uname -a)" != *"raspi"* ]]; then
    echo "Only for Raspberry Pi."
    return
fi

while [ true ]
do
    NOW=$(date +"%Y-%m-%d %T")
    cpu_temp=$(head -n 1 /sys/class/thermal/thermal_zone0/temp)
    cpu_freq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
    printf "%s: CPU frequency %4.0f MHz, temperature %2.0f°C\n" "$NOW"  $(( $cpu_freq/1000 )) $(( $cpu_temp/1000 ))
    sleep 5s
done
