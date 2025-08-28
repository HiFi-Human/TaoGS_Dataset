import multiprocessing
import os

import multiprocessing
import os
from tqdm import tqdm
import cv2
import argparse
import pycolmap

def extract_video(num, start, end, scale, data_folder):
    name = os.path.join(data_folder, f"data{num}.mp4")
    os.system('python extract_video.py {} --start {} --end {} --scale {}'.format(name, start, end, scale))

def extract_mask(time, data_path, bg):
    # image_src = os.path.join(data_path, "{}/images".format(time))
    # output_path = os.path.join(data_path, "{}/images1".format(time))
    
    image_src = os.path.join(data_path, "raw/{}".format(time))
    output_path = os.path.join(data_path, "images/{}".format(time))
    os.system("rm -rf {}".format(output_path))
    command = "python BackgroundMattingV2/inference_images.py \
            --model-type mattingrefine \
            --model-backbone resnet50 \
            --model-backbone-scale 0.25 \
            --model-refine-mode sampling \
            --model-refine-sample-pixels 80000 \
            --model-checkpoint BackgroundMattingV2/pytorch_resnet50.pth \
            --images-src {} \
            --images-bgr {} \
            --output-dir {} \
            --output-type com".format(image_src,bg,output_path)
    os.system(command)

    
def undistortion(j, data, cali):
    ans_folder_path = os.path.join(data, "image_white", str(j))
    os.makedirs(ans_folder_path,exist_ok=True)
    dense_path = os.path.join(data, 'image_undistortion_white', str(j))
    os.makedirs(dense_path,exist_ok=True)
    pycolmap.undistort_images(output_path=dense_path,input_path=cali,image_path=ans_folder_path)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Process some videos.")
    parser.add_argument('--num', type=int, default=81, help='Number of videos to process')
    parser.add_argument('--start', type=int, default=100, help='Start index for processing')
    parser.add_argument('--end', type=int, default=101, help='End index for processing')
    parser.add_argument('--resolution', type=int, default=1, help='Resolution scale for extraction')
    parser.add_argument('--data_path', type=str, default="/data/new_disk4/jyh/datasets/0923/0923coser23")
    parser.add_argument('--bg', type=str, default="/data/new_disk4/jyh/datasets/0923/new_background/1/raw")
    parser.add_argument('--cali', type=str, default="/data/new_disk4/jyh/datasets/0923/colmap_result/sparse/0")
    parser.add_argument("--only_extract", action="store_true", help="Only extract the images and masks")
    parser.add_argument("--only_undistortion", action="store_true", help="Only undistort the images")
    parser.add_argument("--undistort_one_frame", action="store_true", help="undistort 1 frame images")
    parser.add_argument('--output_path', type=str, default="/data/new_disk4/jyh/datasets/0923/0923coser23")

    args = parser.parse_args()
    max_threads = 41
    pool = multiprocessing.Pool(processes=max_threads)
    images = os.listdir(args.data_path)
    images = [i for i in images if i.endswith('.mp4')]
    cam_num = len(images)
    for i in range(1,82):
        pool.apply_async(extract_video, args=(i, args.start, args.end, args.resolution, args.data_path))
    pool.close()
    pool.join()

    for i in tqdm(range(args.start, args.end)):
        extract_mask(i, args.data_path, args.bg)
    
    for j in tqdm(range(args.start, args.end)):
        image_path = os.path.join(args.data_path, "images/com", f"{j}")
        white_bg_path = os.path.join(args.data_path, "image_white", f"{j}")
        os.makedirs(white_bg_path,exist_ok=True)
        for img_num in tqdm(range(cam_num)):
            img_path = os.path.join(image_path, "{}.png".format(img_num))
            ans_path = os.path.join(white_bg_path, "{}.png".format(img_num))
            if not os.path.exists(img_path):
                continue
            ans_image = cv2.imread(img_path,-1)
            mask = ans_image[:,:,3]
            mask[mask<100]=0
            mask[mask>0]=255
            mask = mask//255
            ans_image = ans_image[:,:,:3]
            ans_image[mask==0]=255
            cv2.imwrite(ans_path,ans_image)

    max_threads = 10
    pool = multiprocessing.Pool(processes=max_threads)
    frame_num = 1000
    for i in tqdm(range(args.start, args.end)):
        pool.apply_async(undistortion,args= (i, args.data_path, args.cali))
    pool.close()
    pool.join()
    print('Main process continues to run')

