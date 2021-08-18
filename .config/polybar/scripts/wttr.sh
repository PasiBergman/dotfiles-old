#!/bin/bash
request="https://wttr.in/Espoo?format=3"
wttr=$(curl --silent --connect-timeout 6 "$request")

# Kukkumäki
# wttr=$(sed -r 's/(Kukkumäki),(.+):/%{F#666666}\1:/' <<< $wttr)
 wttr=$(sed -r 's/Espoo:/%{F#a0a0a0}Espoo:/' <<< $wttr)
wttr=$(sed -r 's/ (.+)/ %{F#dfdfdf}\1/' <<< $wttr)

echo $wttr
