#!/bin/bash

cd /mnt

ls /mnt

youtube-dl  -c -i -w --restrict-filenames \
	    -x --audio-format mp3 \
	    -f 249 \
	    -a dl_list.txt
