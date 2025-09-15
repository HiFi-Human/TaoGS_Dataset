import multiprocessing
import os
from pathlib import Path
import shutil
import multiprocessing
import os
from tqdm import tqdm
import cv2
import argparse
import pycolmap

def undistortion(j, data, cali):
    ans_folder_path = os.path.join(data, "image_white", str(j))
    os.makedirs(ans_folder_path,exist_ok=True)
    dense_path = os.path.join(data, 'image_undistortion_white', str(j))
    os.makedirs(dense_path,exist_ok=True)
    pycolmap.undistort_images(output_path=dense_path,input_path=cali,image_path=ans_folder_path)
    
    base_dir = Path(dense_path)
    images_dir = base_dir / "images"
    for item in base_dir.iterdir():
        if item.name != "images":
            if item.is_file():
                item.unlink()
            elif item.is_dir():
                shutil.rmtree(item)
    for image_file in images_dir.iterdir():
        if image_file.is_file():
            destination = base_dir / image_file.name
            shutil.move(str(image_file), str(destination))
    images_dir.rmdir()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Process some videos.")
    parser.add_argument('--start', type=int, default=0, help='Start index for processing')
    parser.add_argument('--end', type=int, default=101, help='End index for processing')
    parser.add_argument('--data_path', type=str)

    args = parser.parse_args()
    
    max_threads = 10
    pool = multiprocessing.Pool(processes=max_threads)
    
    calib_path = os.path.join(args.data_path, "sparse", "0")
    for i in range(args.start, args.end):
        pool.apply_async(undistortion,args= (i, args.data_path, calib_path))
    pool.close()
    pool.join()
    print('Main process continues to run')

