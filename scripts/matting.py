import multiprocessing
import os
from tqdm import tqdm
import cv2
import argparse
import pycolmap
from concurrent.futures import ThreadPoolExecutor

def extract_mask(time, data_path, bg, resolution):
    bg_path = bg
    if resolution != 1:
        bg_imgs = os.listdir(bg)
        bg_imgs = [i for i in bg_imgs if i.endswith(".png") or i.endswith(".jpg")]
        bg_path = os.path.join(data_path, f"bg_resized{resolution}")
        os.makedirs(bg_path, exist_ok=True)
        for i in bg_imgs:
            if os.path.exists(os.path.join(bg_path, i)):
                continue
            bg_img = cv2.imread(os.path.join(bg, i))
            original_height, original_width = bg_img.shape[:2]
            new_width = original_width // resolution
            new_height = original_height // resolution
            bg_img_resized = cv2.resize(bg_img, (new_width, new_height), interpolation=cv2.INTER_CUBIC)
            cv2.imwrite(os.path.join(bg_path, i), bg_img_resized)
            
    image_src = os.path.join(data_path, "raw/{}".format(time))
    output_path = os.path.join(data_path, "images/{}".format(time))
    os.system("rm -rf {}".format(output_path))
    command = "python BackgroundMattingV2/inference_images.py \
            --model-type mattingrefine \
            --model-backbone resnet50 \
            --model-backbone-scale 0.25 \
            --model-refine-mode sampling \
            --model-refine-sample-pixels 80000 \
            --model-checkpoint BackgroundMattingV2/ckpt/pytorch_resnet50.pth \
            --images-src {} \
            --images-bgr {} \
            --output-dir {} \
            --output-type com".format(image_src,bg_path,output_path)
    os.system(command)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Process some videos.")
    parser.add_argument('--cam_num', type=int, default=81, help='last number of videos')
    parser.add_argument('--start', type=int, default=100, help='Start index for processing')
    parser.add_argument('--end', type=int, default=101, help='End index for processing')
    parser.add_argument('--data_path', type=str)
    parser.add_argument('--resolution', '-r', type=int, default=1, help='Resolution scale for extraction')

    args = parser.parse_args()

    cam_num = args.cam_num

    for i in tqdm(range(args.start, args.end)):
        extract_mask(i, args.data_path, os.path.join(args.data_path, "bg"), args.resolution)
    
    # process images to white bg
    for j in range(args.start, args.end):
        white_bg_path = os.path.join(args.data_path, "image_white", f"{j}")
        os.makedirs(white_bg_path, exist_ok=True)
    tasks = []
    for j in range(args.start, args.end):
        image_path = os.path.join(args.data_path, f"images/{j}/com")
        white_bg_path = os.path.join(args.data_path, f"image_white/{j}")
        for img_num in range(cam_num):
            img_path = os.path.join(image_path, "{}.png".format(img_num))
            ans_path = os.path.join(white_bg_path, "{}.png".format(img_num))
            if os.path.exists(img_path):
                tasks.append((img_path, ans_path))

    def process_image(task):
        img_path, ans_path = task
        ans_image = cv2.imread(img_path, -1)
        mask = ans_image[:, :, 3]
        mask[mask < 100] = 0
        mask[mask > 0] = 255
        mask = mask // 255
        ans_image = ans_image[:, :, :3]
        ans_image[mask == 0] = 255
        cv2.imwrite(ans_path, ans_image)

    with ThreadPoolExecutor(max_workers=8) as executor:
        list(tqdm(executor.map(process_image, tasks), total=len(tasks), desc="Processing images"))
        