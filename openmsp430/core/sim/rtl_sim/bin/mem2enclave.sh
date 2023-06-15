#!/bin/bash

# Path to the object file
object_file="../run/pmem.o"
defines="../../../rtl/verilog/openMSP430_defines.v"
info="../../../bench/verilog/enclave_info.v"

# Use objdump to extract the address of the label
start_address=$(objdump -t "$object_file" | grep "enclave_start" | awk '{print $1}')
stop_address=$(objdump -t "$object_file" | grep "enclave_stop" | awk '{print $1}')
PMEM_MODE=$(grep '^`define PMEM_SIZE_' "$defines")
PMEM_SIZE=${PMEM_MODE%_*}
PMEM_SIZE=${PMEM_SIZE##*_}
DMEM_MODE=$(grep '^`define DMEM_SIZE_' "$defines")
DMEM_SIZE=${DMEM_MODE%_*}
DMEM_SIZE=${DMEM_SIZE##*_}

# Convert physical addresses to logical addresses
start_address=$((16#$start_address + 0x10000 - $PMEM_SIZE * 1024))
stop_address=$((16#$stop_address + 0x10000 - 2 - $PMEM_SIZE * 1024))

start_daddress=$(($1 * 2 +0x200))
stop_daddress=$(($2 * 2 +0x200 -2))

# Write addresses
rm -f $info
echo "// TEXT_SECTION" >> $info
echo '`define STXT_START' $start_address >> $info
echo '`define STXT_STOP' $stop_address >> $info

echo "// DATA_SECTION" >> $info
echo '`define SDATA_START' $start_daddress >> $info
echo '`define SDATA_STOP' $stop_daddress >> $info


# Print the address
echo "Address of enclave_start: $start_address"
echo "Address of enclave_stop: $stop_address"
echo "Address of protected_data_start: $start_daddress"
echo "Address of protected_data_stop: $stop_daddress"


