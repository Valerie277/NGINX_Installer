#!/bin/bash
Custompart="Stream"

function checkstream {
    if [-f /mnt/hls/stream.m3u8] 
    then
        return true
    fi
} 
function record() {
    filname=$(date +%F)
    ffmpeg -i /mnt/hls/stream.m3u8 -c copy -bsf:a aac_adtstoasc /home/valerie/stream/$filname-$Custompart.mp4
}
function main(){
    if [checkstream = true]
    then
        record()
    else
        sleep 1
        main()
        echo "# Waiting for Stream.              #" 
    fi
}

echo "#####################################"
echo "#                                   #"
echo "# Recording Script for local HLS    #"
echo "#                                   #"
echo "#####################################"
echo "#                                   #"
echo "# Saving Stream to:                 #"
echo "# /home/valerie/stream/             #"
echo "# --------------------------------- #"

Custompart= read -p 'Enter Filename'
