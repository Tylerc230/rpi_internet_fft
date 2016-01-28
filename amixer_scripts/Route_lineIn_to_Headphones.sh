#!/bin/sh
amixer -Dhw:sndrpiwsp cset name='HPOUT1L Input 1 Volume' 16
amixer -Dhw:sndrpiwsp cset name='HPOUT1R Input 1 Volume' 16
amixer -Dhw:sndrpiwsp cset name='HPOUT1L Input 1' IN3L
amixer -Dhw:sndrpiwsp cset name='HPOUT1R Input 1' IN3R
