#!/usr/bin/env bash

THIS_MINER_NAME="xmrig-cpu-optimized"
[ -t 1 ] && . colors

[[ -z $CUSTOM_URL ]] && echo -e "${YELLOW}CUSTOM_URL is empty${NOCOLOR}" && return 1
[[ -z $CUSTOM_TEMPLATE ]] && echo -e "${YELLOW}CUSTOM_TEMPLATE is empty${NOCOLOR}" && return 1

# worker name: template:rigName
worker="${CUSTOM_TEMPLATE}:${WORKER_NAME}"

. h-manifest.conf
[[ -z $CUSTOM_CONFIG_FILENAME ]] && echo -e "${RED}No CUSTOM_CONFIG_FILENAME is set${NOCOLOR}" && return 1
mkdir -p "$(dirname "$CUSTOM_CONFIG_FILENAME")"

# Write xmrig JSON config for this pool/worker.
cat > "$CUSTOM_CONFIG_FILENAME" <<EOF
{
    "api": {
        "port": 60050,
        "worker-id": "${WORKER_NAME}"
    },
    "cpu": {
        "huge-pages": "no",
        "hw-threads": true
    },
    "donate-level": 0,
    "log-file": null,
    "pools": [
        {
            "url": "${CUSTOM_URL}",
            "user": "${worker}",
            "pass": "${CUSTOM_PASS}",
            "pool-fee": 0
        }
    ]
}
EOF

echo -e "${GREEN}Wrote config -> $CUSTOM_CONFIG_FILENAME (pool: $CUSTOM_URL)${NOCOLOR}"
