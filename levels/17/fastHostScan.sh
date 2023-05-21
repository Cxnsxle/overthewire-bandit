#!/bin/bash

function ctrl_c() {
	echo -e "\n\n[!] Exiting...\n"
	exit 1
}

trap ctrl_c INT

for i in $(seq 1 254); do
	ping -c 1 192.168.100.$i &>/dev/null && echo -e "[+] Host 192.168.100.$i recognized" &
done; wait
