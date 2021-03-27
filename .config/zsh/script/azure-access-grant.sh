#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
source "$SCRIPT_DIR/azure-access-restrictions.sh"

if [ -z "$1" ]|| [ -z "$2" ]
then
  echo "Usage:"
  echo "azure-access \"123.123.123.123\" \"JackJx Home\""
  exit 1
fi

IPV4_CIRD="$1/32"
RULE_NAME="$2"

echo "First network IPv4 : $IPV4_CIRD"
echo ""
echo "Handling RG_DEV_OET_01: local-authserver"
handle_web_app "RG_DEV_OET_01" "local-authserver" "$IPV4_CIRD" "$RULE_NAME"
echo ""
echo "Handling RG_DEV_OET_01: dev-elaketietosi-api"
handle_web_app "RG_DEV_OET_01" "dev-elaketietosi-api" "$IPV4_CIRD" "$RULE_NAME"
echo ""
echo "Handling RG_DEV_OET_02: dev-elaketietosi1-api"
handle_web_app "RG_DEV_OET_02" "dev-elaketietosi1-api" "$IPV4_CIRD" "$RULE_NAME"
echo ""
echo "Handling RG_HYTE_OET_01: hyte-elaketietosi-api"
handle_web_app "RG_HYTE_OET_01" "hyte-elaketietoi-api" "$IPV4_CIRD" "$RULE_NAME"
