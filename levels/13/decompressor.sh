#!/bin/bash

function ctrl_c() {
	echo -e "\n\n[!] Exiting...\n"
	exit 1
}

# Ctrl+c
trap ctrl_c INT

first_file_name="data.gz"
7z x $first_file_name &>/dev/null
decompressed_file_name="$(7z l $first_file_name | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"


while [ $decompressed_file_name ]; do
	echo -e "\n[+] New file decompressed: $decompressed_file_name"
	7z x $decompressed_file_name &>/dev/null
	decompressed_file_name="$(7z l $decompressed_file_name 2>/dev/null | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"
done

