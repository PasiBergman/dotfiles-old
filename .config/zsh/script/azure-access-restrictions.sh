#!/bin/bash

function get_current_restriction() {
  RESOURCE_GROUP=$1
  APP_NAME=$2
  RULE_NAME=$3
  RULE_IP_ADDRESS=$(az webapp config access-restriction show \
    --resource-group "$RESOURCE_GROUP" \
    --name "$APP_NAME" \
    --query "ipSecurityRestrictions[?name=='$RULE_NAME'].ip_address" \
    --output tsv)
  RULE_PRIORITY=$(az webapp config access-restriction show \
    --resource-group "$RESOURCE_GROUP" \
    --name "$APP_NAME" \
    --query "ipSecurityRestrictions[?name=='$RULE_NAME'].priority" \
    --output tsv)
  echo "Rule name:'$RULE_NAME' priority:$RULE_PRIORITY IP:$RULE_IP_ADDRESS"
  return
}

function remove_restriction() {
  RESOURCE_GROUP=$1
  APP_NAME=$2
  RULE_NAME=$3
  echo "Removing rule name:'$RULE_NAME' from $RESOURCE_GROUP:$APP_NAME"
  RESULT=$(az webapp config access-restriction remove \
    --resource-group "$RESOURCE_GROUP" \
    --name "$APP_NAME" \
    --rule-name "$RULE_NAME")
  return
}

function add_access_restriction() {
  ADD_RESOURCE_GROUP=$1
  ADD_APP_NAME=$2
  ADD_RULE_NAME=$3
  ADD_IP_ADDRESS=$4
  ADD_PRIORITY=$5
  echo "Adding rule name:'$ADD_RULE_NAME' IP:$ADD_IP_ADDRESS priority:$ADD_PRIORITY to $ADD_RESOURCE_GROUP:$ADD_APP_NAME"
  RESULT=$(az webapp config access-restriction add \
    --resource-group "$ADD_RESOURCE_GROUP" \
    --name "$ADD_APP_NAME" \
    --rule-name "$ADD_RULE_NAME" \
    --action Allow \
    --ip-address "$ADD_IP_ADDRESS" \
    --priority "$ADD_PRIORITY")
  return
}

function handle_web_app() {
  A_RESOURCE_GROUP=$1
  A_APP_NAME=$2
  A_IP1CIDR=$3
  RULE1_NAME=$4

  RULE_IP_ADDRESS=""
  RULE_PRIORITY=""
  PRIO=$(date +%H%M%S)
  get_current_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE1_NAME"
  RULE_IP_ADDRESS_1="$RULE_IP_ADDRESS"
  [ -z "$RULE_IP_ADDRESS_1" ] && RULE_IP_ADDRESS_1="NONE"
  [ -z "$RULE_PRIORITY" ] || PRIO=$RULE_PRIORITY

  if [ "$A_IP1CIDR" != "$RULE_IP_ADDRESS_1" ]
  then
    [ $RULE_IP_ADDRESS_1 = "NONE" ] || remove_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE1_NAME"
    add_access_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE1_NAME" "$A_IP1CIDR" "$PRIO"
    RULE_IP_ADDRESS_1=$A_IP1CIDR
  fi
  return
}

function handle_web_app_2() {
  A_RESOURCE_GROUP=$1
  A_APP_NAME=$2
  A_IP1CIDR=$3
  A_IP2CIDR=$4
  RULE1_NAME=$5
  RULE2_NAME=$6

  RULE_IP_ADDRESS=""
  RULE_PRIORITY=""
  PRIO1=$(date +%H%M%S)
  get_current_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE1_NAME"
  RULE_IP_ADDRESS_1="$RULE_IP_ADDRESS"
  [ -z "$RULE_IP_ADDRESS_1" ] && RULE_IP_ADDRESS_1="NONE"
  [ -z "$RULE_PRIORITY" ] || PRIO2=$RULE_PRIORITY

  sleep 1

  RULE_IP_ADDRESS=""
  RULE_PRIORITY=""
  PRIO2=$(date +%H%M%S)
  get_current_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE2_NAME"
  RULE_IP_ADDRESS_2="$RULE_IP_ADDRESS"
  [ -z "$RULE_IP_ADDRESS_2" ] && RULE_IP_ADDRESS_2="NONE"
  [ -z "$RULE_PRIORITY" ] || PRIO2=$RULE_PRIORITY

  if [ "$A_IP1CIDR" != "$RULE_IP_ADDRESS_1" ] && [ "$A_IP1CIDR" != "$RULE_IP_ADDRESS_2" ]
  then
    if [ "$A_IP2CIDR" != "$RULE_IP_ADDRESS_1" ]
    then
      [ $RULE_IP_ADDRESS_1 = "NONE" ] || remove_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE1_NAME"
      add_access_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE1_NAME" "$A_IP1CIDR" "$PRIO1"
      RULE_IP_ADDRESS_1=$A_IP1CIDR
    else
      [ $RULE_IP_ADDRESS_2 = "NONE" ] || remove_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE2_NAME"
      add_access_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE2_NAME" "$A_IP1CIDR" "$PRIO2"
      RULE_IP_ADDRESS_2=$A_IP1CIDR
    fi
  fi
  if [ "$A_IP2CIDR" != "$RULE_IP_ADDRESS_1" ] && [ "$A_IP2CIDR" != "$RULE_IP_ADDRESS_2" ]
  then
    if [ "$A_IP1CIDR" != "$RULE_IP_ADDRESS_1" ]
    then
      [ "$RULE_IP_ADDRESS_1" = "NONE" ] || remove_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE1_NAME"
      add_access_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE1_NAME" "$A_IP2CIDR" "$PRIO1"
    else
      [ "$RULE_IP_ADDRESS_2" = "NONE" ] || remove_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE2_NAME"
      add_access_restriction "$A_RESOURCE_GROUP" "$A_APP_NAME" "$RULE2_NAME" "$A_IP2CIDR" "$PRIO2"
    fi
  fi
  return
}

