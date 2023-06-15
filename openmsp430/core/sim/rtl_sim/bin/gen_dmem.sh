output_file="../run/dmem.mem"
rm -f $output_file

for ((i=0; i<$1/32; i++))
do
    
    offset=$(printf "%04x" $(($i*0x10)))
    line="@${offset}  "
    for ((j=0; j<16; j++))
    do
        if [[ $((i*0x10+j)) -ge $(($2)) && $((i*0x10+j)) -lt $(($3)) && $(((i*0x10+j)%2)) -eq 0 ]]; then
            line+="dead "
        elif [[ $((i*0x10+j)) -ge $(($2)) && $((i*0x10+j)) -lt $(($3)) && $(((i*0x10+j)%2)) -eq 1 ]]; then
            line+="beef "
        else
            line+="0000 "
        fi
    done
    echo "$line" >> "$output_file"
done