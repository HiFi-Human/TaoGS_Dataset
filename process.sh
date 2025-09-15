#!/bin/bash

START=0
END=99999 # to the last frame
RESOLUTION=1 
DATA_PATH="dataset/4K_Actor1_Magic_1" # path to your dataset

echo "Running extract_videos.py..."
python scripts/extract_videos.py --start $START --end $END --resolution $RESOLUTION --data_path $DATA_PATH

echo "Running matting.py..."
python scripts/matting.py --start $START --end $END --resolution $RESOLUTION --data_path $DATA_PATH

echo "Running undistort.py..."
python scripts/undistort.py --start $START --end $END --data_path $DATA_PATH

cp -r $DATA_PATH"/colmap" $DATA_PATH"/image_undistortion_white/colmap"
python scripts/colmap2nerf.py --text $DATA_PATH"/sparse/0" --out $DATA_PATH"/image_white/transforms.json"

echo "All scripts executed successfully!"


