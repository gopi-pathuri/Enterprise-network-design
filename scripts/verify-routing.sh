#!/bin/bash
# verify-routing.sh
# Check network reachability

targets=("10.1.10.1" "10.1.20.1" "10.0.0.1")

echo "Starting Network Verification..."
echo "--------------------------------"

for ip in "${targets[@]}"; do
    if ping -c 1 -W 1 "$ip" &> /dev/null; then
        echo "[PASS] $ip is reachable"
    else
        echo "[FAIL] $ip is UNREACHABLE"
    fi
done

echo "--------------------------------"
echo "Verification complete."
