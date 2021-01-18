#!/bin/bash

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

api_key="cat $HOME/.config/.openweather"

# Espoo
request="https://api.openweathermap.org/data/2.5/weather?q=Espoo&appid=${api_key}&units=metric"
location="Espoo"
# Kukkumäki
request="https://api.openweathermap.org/data/2.5/weather?lat=60.179968&lon=24.675675&appid=ec0f26c7022b924b27a850fec5107671&units=metric"
location="Kukkumäki"
# Request weather informatioconn
openweather=$(curl --silent --connect-timeout 6 "$request")

# openweather='{"coord":{"lon":24.6757,"lat":60.18},"weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"}],"base":"stations","main":{"temp":-15,"feels_like":-19.86,"temp_min":-15,"temp_max":-15,"pressure":1018,"humidity":92},"visibility":3500,"wind":{"speed":2.06,"deg":280},"clouds":{"all":75},"dt":1610866167,"sys":{"type":1,"id":1332,"country":"FI","sunrise":1610867218,"sunset":1610891725},"timezone":7200,"id":660158,"name":"Espoo","cod":200}'


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
    *)j
        icon_char=""
        ;;
esac

sunriseSunset=$(sunriseOrSunset $sunrise $sunset)
weather="%{F#777} ${icon_char}%{F#dfdfdf}   ${main_temp}°C [ ${main_feels_like}°C] %{F#777}${wind_speed}m/s ${sunriseSunset}"

echo $weather
