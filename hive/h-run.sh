#!/usr/bin/env bash
cd `dirname $0`

. h-manifest.conf

[[ -z $CUSTOM_LOG_BASENAME ]] && echo "No CUSTOM_LOG_BASENAME is set" && exit 1
[[ -z $CUSTOM_CONFIG_FILENAME ]] && echo "No CUSTOM_CONFIG_FILENAME is set" && exit 1
[[ ! -f $CUSTOM_CONFIG_FILENAME ]] && echo "Custom config $CUSTOM_CONFIG_FILENAME is not found" && exit 1
CUSTOM_LOG_BASEDIR=`dirname "$CUSTOM_LOG_BASENAME"`
[[ ! -d $CUSTOM_LOG_BASEDIR ]] && mkdir -p "$CUSTOM_LOG_BASEDIR"

cd /hive/custom/$CUSTOM_NAME

# API on 60050 (HiveOS reads stats from there), JSON config with pool written by h-config.sh
./xmrig --api-port=60050 --config=$CUSTOM_CONFIG_FILENAME $@ 2>&1 | tee $CUSTOM_LOG_BASENAME.log
