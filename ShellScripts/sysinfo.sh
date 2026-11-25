#!/bin/bash

# Author: Rahul Pokhariyal
# Script: System Information Report

echo "=========================================="
echo "       SYSTEM INFORMATION REPORT"
echo "=========================================="
echo "Author: Rahul Pokhariyal"
echo "Roll Number: 2601730090"
echo "Date: $(date)"
echo

echo "---------- CPU INFORMATION ----------"
lscpu | grep -E '^(CPU\(s\)|Core\(s\) per socket|Model name):'

echo
echo "---------- MEMORY INFORMATION ----------"
free -h | awk '/Mem:/ {
    print "Total Memory: " $2
    print "Used Memory: " $3
}'

echo
echo "---------- TOP 3 PROCESSES BY CPU ----------"
ps aux | head -1
ps aux | tail -n +2 | sort -nrk 3 | head -3

echo
echo "=========================================="
echo "Report generated successfully."
echo "=========================================="
