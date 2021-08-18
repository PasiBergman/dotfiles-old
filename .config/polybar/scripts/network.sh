#!/bin/bash

NETWORK_INFO=$(curl --connect-timeout 6 --silent https://ifconfig.co/json)

if [ -z "$NETWORK_INFO" ]; then
    echo -n "%{F#f2e421}%{o#ff6600}Disconnected"
    exit 0
fi

NET_IPv4=$(echo $NETWORK_INFO | jq -r .ip 2>/dev/null)
NET_ASN_ORG=$(echo $NETWORK_INFO | jq -r .asn_org 2>/dev/null)
NET_REGION=$(echo $NETWORK_INFO | jq -r .region_name 2>/dev/null)

case "$NET_IPv4" in
    "91.225.69.19")
        NET_ASN_ORG="Keva VPN"
        echo -n "%{F#ff7700}%{o#ff7700}$NET_ASN_ORG: "
        ;;
    "194.136.16.66")
        NET_ASN_ORG="HiQ VPN"
        echo -n "%{F#f2e421}$NET_ASN_ORG: "
        ;;
    *)
        echo -n "%{F#a0a0a0}$NET_ASN_ORG: "
        ;;
esac

echo "%{F#dfdfdf}$NET_IPv4"
