import multiprocessing
import os
import argparse

def extract_video(num, start, end, scale, data_folder):
    name = os.path.join(data_folder, f"data{num}.mp4")
    os.system('python scripts/extract_video.py {} --start {} --end {} --scale {}'.format(name, start, end, scale))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Process some videos.")
    parser.add_argument('--cam_num', type=int, default=81, help='last number of videos')
    parser.add_argument('--start', type=int, default=0, help='Start index for processing')
    parser.add_argument('--end', type=int, default=101, help='End index for processing')
    parser.add_argument('--resolution', '-r', type=int, default=1, help='Resolution scale for extraction')
    parser.add_argument('--data_path', type=str)

    args = parser.parse_args()
    max_threads = 41
    pool = multiprocessing.Pool(processes=max_threads)
    cam_num = args.cam_num
    for i in range(1,cam_num+1):
        pool.apply_async(extract_video, args=(i, args.start, args.end, args.resolution, args.data_path))
    pool.close()
    pool.join()

