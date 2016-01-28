#!/bin/bash

# $2 added to support 1st line argument. i.e. "./Record_from_linein.sh -q" will stop all the control information being displayed on screen

#Record rom onboard Line Input to AP
# +8dB input PGA gain
amixer $2 -Dhw:sndrpiwsp cset name='IN3L Volume' $1
amixer $2 -Dhw:sndrpiwsp cset name='IN3R Volume' $1 

# better THD in normal mode vs lower noise floor in high performance
amixer $2 -Dhw:sndrpiwsp cset name='IN3 High Performance Switch' on
# Configure the input path for 0dB Gain,  HPF with a low cut off for DC removal
amixer $2 -Dhw:sndrpiwsp cset name='IN3L Digital Volume' 128
amixer $2 -Dhw:sndrpiwsp cset name='IN3R Digital Volume' 128
amixer $2 -Dhw:sndrpiwsp cset name='LHPF1 Input 1' IN3L
amixer $2 -Dhw:sndrpiwsp cset name='LHPF2 Input 1' IN3R
amixer $2 -Dhw:sndrpiwsp cset name='LHPF1 Mode' High-pass
amixer $2 -Dhw:sndrpiwsp cset name='LHPF2 Mode' High-pass
amixer $2 -Dhw:sndrpiwsp cset name='LHPF1 Coefficients' 240,3
amixer $2 -Dhw:sndrpiwsp cset name='LHPF2 Coefficients' 240,3
# Configure the Audio Interface and volume 0dB
amixer $2 -Dhw:sndrpiwsp cset name='AIF1TX1 Input 1' LHPF1
amixer $2 -Dhw:sndrpiwsp cset name='AIF1TX1 Input 1 Volume' 32
amixer $2 -Dhw:sndrpiwsp cset name='AIF1TX2 Input 1' LHPF2
amixer $2 -Dhw:sndrpiwsp cset name='AIF1TX2 Input 1 Volume' 32


# The following command should be used to test
# arecord -Dhw:sndrpiwsp -r 44100 -c 2 -f S32_LE <file>

