#!/bin/bash
# Run on the Kali Linux VM - LAB USE ONLY.
# Only target machines you own, on an isolated host-only network.
# Usage: sudo ./attack-tests.sh <metasploitable-ip>

TARGET="$1"
if [ -z "$TARGET" ]; then
    echo "Usage: sudo $0 <target-ip>"
    exit 1
fi

echo "[1/2] ICMP ping test -> expect: 'ICMP Ping Detected'"
ping -c 3 "$TARGET"

sleep 2

echo "[2/2] Nmap SYN scan -> expect: 'NMAP SYN scan detected'"
sudo nmap -sS -sV -A "$TARGET"
