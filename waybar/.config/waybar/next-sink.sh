#!/bin/bash

current_sink=$(pactl get-default-sink)
next_sink=$(pactl list short sinks | awk '{print $2}' | awk -v current_sink="$current_sink" '
{
	lines[NR]=$0
}
END {
	for (i=1; i<=NR; i++) {
		if (lines[i] == current_sink) {
			if (i == NR) {
				print lines[1];
			} else {
				print lines[i+1];
			}
		}
	}
}')

pactl set-default-sink "$next_sink"
