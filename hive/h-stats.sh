#!/usr/bin/env bash

# HiveOS stats: reads xmrig JSON API on 127.0.0.1:60050 and prints the stats
# JSON HiveOS dashboard expects: hs = per-thread hashrate (H/s),
# ar = [accepted, rejected], uptime, algo.

API_PORT="60050"

stats_raw=`curl --connect-timeout 2 --max-time $API_TIMEOUT --silent --noproxy '*' http://127.0.0.1:$API_PORT`
if [[ $? -ne 0 || -z $stats_raw ]]; then
    echo -e "${YELLOW}Failed to read xmrig from localhost:$API_PORT${NOCOLOR}"
    exit 1
fi

stats=$(
    echo "$stats_raw" | jq '
        {
          hs: [ (.hashrate.threads[]? | .[0] // 0) ],
          hs_units: "hs",
          algo: (.algo // ""),
          uptime: (.connection.uptime // 0),
          ar: [ (.results.shares_good // 0), ((.results.shares_total // 0) - (.results.shares_good // 0)) ]
        }'
)
echo "$stats"
