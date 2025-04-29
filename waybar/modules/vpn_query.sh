#!/bin/bash

if nmcli -f GENERAL.STATE con show M85 | grep -q -E '\bactiv'; then
    echo -e "{\"text\":\"\"}"
else
    echo -e "{\"text\":\"\"}"
fi
