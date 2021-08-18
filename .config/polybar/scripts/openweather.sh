#!/bin/bash

echo "Disabled"
exit 0

sunriseOrSunset() {
    sunrise=$1
    sunset=$2
    sunrise_time=$(date -d @${sunrise} +%H:%m)
    sunset_time=$(date -d @${sunset} +%H:%m)
    now=$(date +%s)
    if [ $now -lt $sunrise ] || [ $now -gt $sunset ]; then
        echo "  $sunrise_time"
    else
        echo "  $sunset_time"
    fi
}
#
# https://openweathermap.org/current
#
# Get API key
api_key=$(cat $HOME/.config/.openweather)
# Espoo
request="https://api.openweathermap.org/data/2.5/weather?q=Espoo&appid=${api_key}&units=metric"
# Request weather informatioconn
openweather=$(curl --silent --connect-timeout 6 "$request")

if [ -n "$1" ]; then
    echo $openweather | jq .
fi

main_temp=$(echo $openweather | jq '.main.temp')
main_temp=${main_temp%.*}
main_feels_like=$(echo $openweather | jq '.main.feels_like')
main_feels_like=${main_feels_like%.*}
wind_speed=$(echo $openweather | jq '.wind.speed')
wind_speed=${wind_speed%.*}
wind_deg=$(echo $openweather | jq '.wind.speed')
sunrise=$(echo $openweather | jq '.sys.sunrise')
sunset=$(echo $openweather | jq '.sys.sunset')
weather_icon=$(echo $openweather | jq -r '.weather[0].icon')

case "$weather_icon" in
    01d)
        icon_char=""
        ;;
    01n)
        icon_char=""
        ;;
    02d)
        icon_char=""
        ;;
    02n)
        icon_char=""
        ;;
    03d)
        icon_char=""
        ;;
    03n)
        icon_char=""
        ;;
    04d)
        icon_char=""
        ;;
    04n)
        icon_char=""
        ;;
    09d)
        icon_char=""
        ;;
    09n)
        icon_char=""
        ;;
    10d)
        icon_char=" "
        ;;
    10n)
        icon_char=" "
        ;;
    11d)
        icon_char=" "
        ;;
    11n)
        icon_char=" "
        ;;
    13d)
        icon_char=" "
        ;;
    13n)
        icon_char=" "
        ;;
    50d)
        icon_char=" "
        ;;
    50n)
        icon_char=" "
        ;;
    *)
        icon_char=""
        ;;
esac

sunriseSunset=$(sunriseOrSunset $sunrise $sunset)
weather="%{F#a0a0a0} ${icon_char}%{F#dfdfdf}   ${main_temp}°C [ ${main_feels_like}°C] %{F#a0a0a0}${wind_speed}m/s ${sunriseSunset}"

echo $weather
