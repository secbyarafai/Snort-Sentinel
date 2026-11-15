#!/bin/bash
# Run on the Ubuntu IDS VM.
# Usage: sudo ./run-snort.sh [interface]   (default: ens33)

IFACE="${1:-ens33}"
CONF=/etc/snort/snort.conf

echo "[*] Validating Snort configuration..."
if ! sudo snort -T -q -c "$CONF"; then
    echo "[!] Config test failed - fix the errors above before running."
    exit 1
fi

echo "[*] Starting Snort on $IFACE (console alerts). Press Ctrl+C to stop."
sudo snort -A console -q -c "$CONF" -i "$IFACE"

# Alternative: log full alerts to /var/log/snort/alert instead of the console
# sudo snort -q -l /var/log/snort -i "$IFACE" -A full -c "$CONF"
