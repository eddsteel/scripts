#!/usr/bin/env bash
on="on"
onoff=${1:-on}

powered() {
    status=$(echo -e "show\nquit\n" | bluetoothctl | grep Powered | tr -d '[:space:]')
    [ "Powered:yes" = "$status" ]
}

if [ "status" = "$onoff" ]; then
    if powered; then
        echo "on"
        exit 0
    else
        echo "off"
        exit 1
    fi
fi


if [ "toggle" = "$onoff" ]; then
    if powered; then
        onoff="off"
    else
        onoff="on"
    fi
fi

echo -e "power $onoff\nconnect 88:C6:26:0B:2A:D3\nquit\n" | bluetoothctl
