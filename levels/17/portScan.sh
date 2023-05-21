#!/bin/bash

function ctrl_c() {
	echo -e "\n\n[!] Exiting...\n"
	exit 1
}

trap ctrl_c INT

for port in $(seq 31000 32000); do
	(echo '' >/dev/tcp/127.0.0.1/$port) 2>/dev/null && echo -e "[+] $port - OPEN"
done

