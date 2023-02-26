#!/usr/bin/env bash

wd=$(echo $1 | sed -e "s|^$HOME|~|")

if [[ ${wd:0:1} == "~" ]];
then 
    wd_array=($(echo $wd | sed -e 's|/| |g'))
    if [[ ${#wd_array[*]} -gt 3 ]]; then
        echo "~/../${wd_array[-3]}/${wd_array[-2]}/${wd_array[-1]}"
    else
        echo $wd
    fi
else 
    echo $wd
fi