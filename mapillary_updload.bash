#!/bin/bash

chemin="/$HOME/timelapse/photos"
mapillary_user="user"

mapillary_tools process_and_upload --rerun --advanced --import_path \
    "$chemin" --user_name $mapillary_user --duplicate_distance 0.5\
    --duplicate_angle 40 --interpolate_directions
