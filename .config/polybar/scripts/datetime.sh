#/bin/bash

WEEKDAY=$(date +%a)
DAYNR=$(date +%-d)
TIMENOW=$(date +%H.%M)

case $DAYNR in
    1)
        DAYNR="${DAYNR}st"
        ;;
    2)
        DAYNR="${DAYNR}nd"
        ;;
    3)
        DAYNR="${DAYNR}rd"
        ;;
    *)
        DAYNR="${DAYNR}th"
        ;;
esac

echo "%{F#a0a0a0}$WEEKDAY $DAYNR: %{F#dfdfdf}$TIMENOW"
