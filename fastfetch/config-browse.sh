#!/bin/bash

for i in {2..30}
do
	echo "Config example number $i"
	fastfetch --config examples/$i.jsonc
done
