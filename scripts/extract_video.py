import os, sys
import cv2
from os.path import join
from tqdm import tqdm
from glob import glob

from natsort import natsorted

mkdir = lambda x: os.makedirs(x, exist_ok=True)

def extract_video(videoname, path, start, end, ext, step, scale=1):
    base = os.path.basename(videoname).replace('.mp4', '')
    if not os.path.exists(videoname):
        return base

    cam_id = int(base[4:]) - 1

    outpath = path
    if not os.path.exists(outpath):
        os.makedirs(outpath, exist_ok=True)


    video = cv2.VideoCapture(videoname)
    totalFrames = int(video.get(cv2.CAP_PROP_FRAME_COUNT))
    
    
    video.set(cv2.CAP_PROP_POS_FRAMES, start)
    for cnt in tqdm(range(start, totalFrames), desc='{:10s}'.format(os.path.basename(videoname))):
        if cnt >= end:break
        ret, frame = video.read()
        if not ret:continue
        os.makedirs(join(outpath, 'raw/{}'.format(cnt)),exist_ok=True)
        if scale == 1:
            cv2.imwrite(join(outpath, 'raw/{}/{}.{}'.format(cnt, cam_id, ext)), frame)
        else:
            cv2.imwrite(join(outpath, 'raw/{}/{}.{}'.format(cnt, cam_id, ext)), cv2.resize(frame,(int(frame.shape[1]/scale),int(frame.shape[0]/scale))))
    video.release()
    return base

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('path', type=str, help="the path of data")
    parser.add_argument('--ext', type=str, default='png', choices=['jpg', 'png'], help="image file extension")
    parser.add_argument('--start', type=int, default=0, help='frame start')
    parser.add_argument('--end', type=int, default=101, help='frame end')    
    parser.add_argument('--step', type=int, default=1, help='frame step')
    parser.add_argument('--scale', type=int, default=1, help='resolution scale')
    parser.add_argument('--debug', action='store_true')
    args = parser.parse_args()

    if os.path.exists(args.path):
        video_dir, video_name = os.path.split(args.path)
        if video_name.endswith('.mp4'):
            videos = [args.path]
        else:
            videos = natsorted(glob(join(video_dir, '*.mp4')))
        subs = []
        for video in videos:
            basename = extract_video(video, video_dir, start=args.start, end=args.end, ext=args.ext, step=args.step, scale=args.scale)
            subs.append(basename)
    else:
        print(args.path, ' does not exist')
