#!/bin/bash
~/.steam/steam/steamapps/common/GarrysMod/bin/gmad_linux custom_crosshairs

echo -e "Changes made $(date)\n" > /tmp/changes.txt
vim + /tmp/changes.txt

LD_PRELOAD=~/.steam/steam/steamapps/common/GarrysMod/bin/libsteam_api.so \
		   ~/.steam/steam/steamapps/common/GarrysMod/bin/gmpublish_linux \
		   update -id 2405650454 \
		   -addon ./custom_crosshairs.gma \
		   -changes "$(cat /tmp/changes.txt)"

		   rm /tmp/changes.txt
