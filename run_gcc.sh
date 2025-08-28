python process_gcc.py --num 81 --start 100 --end 110 --data_path /data/new_disk4/jyh/datasets/0923/0923coser23 \
 --bg /data/new_disk4/jyh/datasets/0923/new_background/1/raw --cali /data/new_disk4/jyh/datasets/0923/colmap_result/sparse/0 

# hiphop
python process_gcc.py --num 81 --start 671 --end 1300 --data_path /data/new_disk5/zhangzhr/rerf_new_data/hip_hop_dance1 \
 --bg /data/new_disk5/zhangzhr/rerf_new_data/hip_hop_dance1_bg/0/raw --cali /data/new_disk5/zhangzhr/rerf_new_data/hip_hop_dance1/sparse_/0 

# gcc walk2
python process_gcc.py --num 81 --start 83 --end 84 --data_path /data/new_disk4/guochch/datasets/0723/gcc_walk2 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_walk --cali /data/new_disk4/guochch/datasets/0723/cali/sparse/0 --only_extract

python process_gcc.py --num 81 --start 83 --end 2000 --data_path /data/new_disk4/guochch/datasets/0723/gcc_walk2 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_walk --cali /data/new_disk4/guochch/datasets/0723/cali/sparse/0 --undistort_one_frame --only_undistortion

python process_gcc.py --num 81 --start 83 --end 383 --data_path /data/new_disk4/guochch/datasets/0723/gcc_walk2 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_walk --cali /data/new_disk4/guochch/datasets/0723/cali/sparse/0 

python process_gcc.py --num 81 --start 383 --end 2000 --data_path /data/new_disk4/guochch/datasets/0723/gcc_walk2 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_walk --cali /data/new_disk4/guochch/datasets/0723/cali/sparse/0 

# rap
CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 70 --end 1000 --data_path /data/new_disk4/guochch/datasets/0723/szh_rap1 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_rap --cali /data/new_disk4/guochch/datasets/0723/cali/sparse/0 
CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 70 --end 71 --data_path /data/new_disk4/guochch/datasets/0723/szh_rap1 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_rap --cali /data/new_disk4/guochch/datasets/0723/cali/sparse/0 --only_undistortion
CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 110 --end 120 --data_path /data/new_disk4/guochch/datasets/0723/szh_rap1 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_rap --cali /data/new_disk4/guochch/datasets/0723/cali/sparse/0 --only_undistortion
 CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 120 --end 130 --data_path /data/new_disk4/guochch/datasets/0723/szh_rap1 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_rap --cali /data/new_disk4/guochch/datasets/0723/cali/sparse/0 --only_undistortion
 
CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 40 --start 0 --end 100 --data_path /data/new_disk4/guochch/datasets/0828/gcc --only_extract
CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 40 --start 0 --end 1 --data_path /data/new_disk4/guochch/datasets/0828/bg --only_extract
CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 40 --start 0 --end 1 --data_path /data/new_disk4/guochch/datasets/0828/cali --only_extract
CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 40 --start 0 --end 1 --data_path /data/new_disk4/guochch/datasets/0828/cali1 --only_extract
CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 40 --start 0 --end 1 --data_path /data/new_disk4/guochch/datasets/0828/cali2 --only_extract
CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 40 --start 0 --end 100 --data_path /data/new_disk4/guochch/datasets/0828/gcc \
 --bg /data/new_disk4/guochch/datasets/0828/bg --cali /data/new_disk4/guochch/datasets/0828/sparse/0
CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 40 --start 0 --end 1 --data_path /data/new_disk4/guochch/datasets/0828/gcc \
 --bg /data/new_disk4/guochch/datasets/0828/bg --cali /data/new_disk4/guochch/datasets/0828/sparse/0

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 0 --end 500 --data_path /data/new_disk4/jyh/datasets/0509/guzheng3 \
 --bg /data/new_disk4/jyh/datasets/0509/bg2/0/raw --cali /data/new_disk4/jyh/datasets/0509/cali2/sparse/0
CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 0 --end 500 --data_path /data/new_disk4/jyh/datasets/0509/hu_flute2 \
 --bg /data/new_disk4/jyh/datasets/0509/bg2/0/raw --cali /data/new_disk4/jyh/datasets/0509/cali2/sparse/0

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 0 --end 500 --data_path /data/new_disk4/jyh/datasets/0509/guzheng3 \
 --bg /data/new_disk4/jyh/datasets/0509/bg2/0/raw --cali /data/new_disk4/jyh/datasets/0509/cali2/sparse/0 --only_extract
CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 0 --end 500 --data_path /data/new_disk4/jyh/datasets/0509/hu_flute2 \
 --bg /data/new_disk4/jyh/datasets/0509/bg2/0/raw --cali /data/new_disk4/jyh/datasets/0509/cali2/sparse/0 --only_extract
CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 70 --end 700 --data_path /data/new_disk4/guochch/datasets/0723/szh_rap1 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_rap --cali /data/new_disk4/guochch/datasets/0723/cali/sparse/0 --only_extract


CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 0 --end 1 --data_path /data/new_disk4/guochch/SpacetimeGaussians/datasets/02_Flames/0-299 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_rap --cali /data/new_disk4/guochch/SpacetimeGaussians/datasets/02_Flames/sparse/0 --only_undistortion

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 0 --end 200 --data_path /data/new_disk4/shenzhh/sjtu_data/boxing1 \
 --bg /data/new_disk4/shenzhh/sjtu_data/bg2/0/raw --cali /data/new_disk4/shenzhh/sjtu_data/cali/sparse/0

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 200 --end 300 --data_path /data/new_disk4/shenzhh/sjtu_data/boxing1 \
 --bg /data/new_disk4/shenzhh/sjtu_data/bg2/0/raw --cali /data/new_disk4/shenzhh/sjtu_data/cali_gcc/sparse/0
 
CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 70 --end 71 --data_path /data/new_disk4/guochch/datasets/0723/szh_rap1 \
 --bg /data/new_disk4/guochch/datasets/0723/bg_rap --cali /data/new_disk4/guochch/datasets/0723/cali/sparse/0 --only_undis

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 40 --start 30 --end 59 --data_path /data/new_disk4/ultrastage/1005/hy1 \
 --bg /data/new_disk4/ultrastage/1005/bg/0/raw --cali /data/new_disk4/ultrastage/1005/cali1/sparse/0 

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 1 --end 2 --data_path /data/new_disk4/jyh/datasets/0509/cali2 \
 --bg /data/new_disk4/ultrastage/1005/bg/0/raw --cali /data/new_disk4/jyh/datasets/0509/cali2/sparse/0 --only_undistor

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 0 --end 1 --data_path /data/new_disk4/guochch/datasets/1226 \
 --bg /data/new_disk4/jyh/datasets/0509/bg2/0/raw --cali /data/new_disk4/jyh/datasets/0509/cali2/sparse/0 --only_extract


CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 1000 --end 2000 --data_path /data/new_disk4/guochch/datasets/0723/szh_rap1 \
 --bg /data/new_disk4/jyh/datasets/0509/bg2/0/raw --cali /data/new_disk4/jyh/datasets/0509/cali2/sparse/0 --only_undistortion

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 250 --end 500 --data_path /data/new_disk4/jyh/datasets/1010/taotao3 \
 --bg /data/new_disk4/jyh/datasets/1010/bg2/1/raw --cali /data/new_disk4/jyh/datasets/1010/1010cali/1/sparse/0

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 0 --end 250 --data_path /data/new_disk4/jyh/datasets/1010/taotao3 \
 --bg /data/new_disk4/jyh/datasets/1010/bg2/1/raw --cali /data/new_disk4/jyh/datasets/1010/1010cali/1/sparse/0

CUDA_VISIBLE_DEVICES=2 python get_mask.py --num 81 --start 0 --end 250 --data_path /data/new_disk4/jyh/datasets/1010/taotao3
CUDA_VISIBLE_DEVICES=2 python get_mask.py --num 81 --start 649 --end 700 --data_path /data/new_disk4/guochch/datasets/0723/szh_rap1

CUDA_VISIBLE_DEVICES=0 python process_gcc.py --num 81 --start 4 --end 125 --data_path /data/new_disk6/guochch/dataset/1010/1010dancer1 \
 --bg /data/new_disk4/jyh/datasets/1010/bg2/1/raw --cali /data/new_disk4/jyh/datasets/1010/1010cali/1/sparse/0

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 125 --end 250 --data_path /data/new_disk6/guochch/dataset/1010/1010dancer1 \
 --bg /data/new_disk4/jyh/datasets/1010/bg2/1/raw --cali /data/new_disk4/jyh/datasets/1010/1010cali/1/sparse/0

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 250 --end 375 --data_path /data/new_disk6/guochch/dataset/1010/1010dancer1 \
 --bg /data/new_disk4/jyh/datasets/1010/bg2/1/raw --cali /data/new_disk4/jyh/datasets/1010/1010cali/1/sparse/0

CUDA_VISIBLE_DEVICES=3 python process_gcc.py --num 81 --start 375 --end 500 --data_path /data/new_disk6/guochch/dataset/1010/1010dancer1 \
 --bg /data/new_disk4/jyh/datasets/1010/bg2/1/raw --cali /data/new_disk4/jyh/datasets/1010/1010cali/1/sparse/0

/data/new_disk6/guochch/dataset/1014/hanfu9
CUDA_VISIBLE_DEVICES=0 python process_gcc.py --num 81 --start 500 --end 560 --data_path /data/new_disk6/guochch/dataset/1014/hanfu9 \
 --bg /data/new_disk4/jyh/datasets/1014/background/1/raw --cali /data/new_disk4/jyh/datasets/1014/cali/1/sparse/0

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 560 --end 620 --data_path /data/new_disk6/guochch/dataset/1014/hanfu9 \
 --bg /data/new_disk4/jyh/datasets/1014/background/1/raw --cali /data/new_disk4/jyh/datasets/1014/cali/1/sparse/0

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 620 --end 680 --data_path /data/new_disk6/guochch/dataset/1014/hanfu9 \
 --bg /data/new_disk4/jyh/datasets/1014/background/1/raw --cali /data/new_disk4/jyh/datasets/1014/cali/1/sparse/0

CUDA_VISIBLE_DEVICES=3 python process_gcc.py --num 81 --start 680 --end 750 --data_path /data/new_disk6/guochch/dataset/1014/hanfu9 \
 --bg /data/new_disk4/jyh/datasets/1014/background/1/raw --cali /data/new_disk4/jyh/datasets/1014/cali/1/sparse/0

/data/new_disk6/guochch/dataset/1014/hanfu4
CUDA_VISIBLE_DEVICES=0 python process_gcc.py --num 81 --start 0 --end 175 --data_path /data/new_disk6/guochch/dataset/1014/hanfu4 \
 --bg /data/new_disk4/jyh/datasets/1014/background/1/raw --cali /data/new_disk4/jyh/datasets/1014/cali/1/sparse/0

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 175 --end 350 --data_path /data/new_disk6/guochch/dataset/1014/hanfu4 \
 --bg /data/new_disk4/jyh/datasets/1014/background/1/raw --cali /data/new_disk4/jyh/datasets/1014/cali/1/sparse/0

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 350 --end 525 --data_path /data/new_disk6/guochch/dataset/1014/hanfu4 \
 --bg /data/new_disk4/jyh/datasets/1014/background/1/raw --cali /data/new_disk4/jyh/datasets/1014/cali/1/sparse/0

CUDA_VISIBLE_DEVICES=3 python process_gcc.py --num 81 --start 525 --end 700 --data_path /data/new_disk6/guochch/dataset/1014/hanfu4 \
 --bg /data/new_disk4/jyh/datasets/1014/background/1/raw --cali /data/new_disk4/jyh/datasets/1014/cali/1/sparse/0

/data/new_disk4/jyh/datasets/1105/cali1/1
CUDA_VISIBLE_DEVICES=0 python process_gcc.py --num 81 --start 0 --end 175 --data_path /data/new_disk6/guochch/dataset/1105/1105hanfu4 \
 --bg /data/new_disk4/jyh/datasets/1105/bg2/1/raw --cali /data/new_disk4/jyh/datasets/1105/cali1/1/sparse/0

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 175 --end 350 --data_path /data/new_disk6/guochch/dataset/1105/1105hanfu4 \
 --bg /data/new_disk4/jyh/datasets/1105/bg2/1/raw --cali /data/new_disk4/jyh/datasets/1105/cali1/1/sparse/0

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 350 --end 525 --data_path /data/new_disk6/guochch/dataset/1105/1105hanfu4 \
 --bg /data/new_disk4/jyh/datasets/1105/bg2/1/raw --cali /data/new_disk4/jyh/datasets/1105/cali1/1/sparse/0

CUDA_VISIBLE_DEVICES=3 python process_gcc.py --num 81 --start 525 --end 700 --data_path /data/new_disk6/guochch/dataset/1105/1105hanfu4 \
 --bg /data/new_disk4/jyh/datasets/1105/bg2/1/raw --cali /data/new_disk4/jyh/datasets/1105/cali1/1/sparse/0

/data/new_disk4/jyh/datasets/0923/new_background/2k/raw
CUDA_VISIBLE_DEVICES=0 python process_gcc.py --num 81 --start 680 --end 760 --data_path /data/new_disk6/guochch/dataset/0923/0923dancer_2 \
 --bg /data/new_disk4/jyh/datasets/0923/new_background/2k/raw --cali /data/new_disk4/jyh/datasets/0923/colmap_result_0923_downsample/sparse/0

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 760 --end 840 --data_path /data/new_disk6/guochch/dataset/0923/0923dancer_2 \
 --bg /data/new_disk4/jyh/datasets/0923/new_background/2k/raw --cali /data/new_disk4/jyh/datasets/0923/colmap_result_0923_downsample/sparse/0

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 840 --end 920 --data_path /data/new_disk6/guochch/dataset/0923/0923dancer_2 \
 --bg /data/new_disk4/jyh/datasets/0923/new_background/2k/raw --cali /data/new_disk4/jyh/datasets/0923/colmap_result_0923_downsample/sparse/0

CUDA_VISIBLE_DEVICES=3 python process_gcc.py --num 81 --start 920 --end 1000 --data_path /data/new_disk6/guochch/dataset/0923/0923dancer_2 \
 --bg /data/new_disk4/jyh/datasets/0923/new_background/2k/raw --cali /data/new_disk4/jyh/datasets/0923/colmap_result_0923_downsample/sparse/0


/data/new_disk6/zsk/data/zsk_clothe
CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 0 --end 50 --data_path /data/new_disk6/zsk/data/zsk_clothe \
 --bg /data/new_disk6/zsk/data/zsk_clothe/bg/0/images --cali /data/new_disk6/zsk/data/cali/0/sparse/0

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 50 --end 100 --data_path /data/new_disk6/zsk/data/zsk_clothe \
 --bg /data/new_disk6/zsk/data/zsk_clothe/bg/0/images --cali /data/new_disk6/zsk/data/cali/0/sparse/0

CUDA_VISIBLE_DEVICES=3 python process_gcc.py --num 81 --start 100 --end 150 --data_path /data/new_disk6/zsk/data/zsk_clothe \
 --bg /data/new_disk6/zsk/data/zsk_clothe/bg/0/images --cali /data/new_disk6/zsk/data/cali/0/sparse/0

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 150 --end 200 --data_path /data/new_disk6/zsk/data/zsk_clothe \
 --bg /data/new_disk6/zsk/data/zsk_clothe/bg/0/images --cali /data/new_disk6/zsk/data/cali/0/sparse/0

CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 250 --end 300 --data_path /data/new_disk6/zsk/data/zsk_clothe \
 --bg /data/new_disk6/zsk/data/zsk_clothe/bg/0/images --cali /data/new_disk6/zsk/data/cali/0/sparse/0

CUDA_VISIBLE_DEVICES=3 python process_gcc.py --num 81 --start 200 --end 250 --data_path /data/new_disk6/zsk/data/zsk_clothe \
 --bg /data/new_disk6/zsk/data/zsk_clothe/bg/0/images --cali /data/new_disk6/zsk/data/cali/0/sparse/0

/data/new_disk4/jyh/datasets/0509/hu_flute2
CUDA_VISIBLE_DEVICES=0 python process_gcc.py --num 81 --start 8 --end 160 --data_path /data/new_disk4/jyh/datasets/0509/hu_flute2 \
 --bg /data/new_disk4/jyh/datasets/0509/hu_bg/0/raw --cali /data/new_disk4/jyh/datasets/0509/hu_flute2/sparse_/0
CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 160 --end 320 --data_path /data/new_disk4/jyh/datasets/0509/hu_flute2 \
 --bg /data/new_disk4/jyh/datasets/0509/hu_bg/0/raw --cali /data/new_disk4/jyh/datasets/0509/hu_flute2/sparse_/0

CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 199 --end 200 --data_path /data/new_disk6/guochch/dataset/0628/jyh_family \
 --bg /data/new_disk6/guochch/dataset/0628/bg/0/raw --cali /data/new_disk6/guochch/dataset/0628/cali/0/sparse/0


/data/new_disk6/guochch/dataset/0514/cali/0/sparse/0
CUDA_VISIBLE_DEVICES=1 python process_gcc.py --num 81 --start 30 --end 300 --data_path /data/new_disk6/guochch/dataset/0514/czl_box2 \
 --bg /data/new_disk6/guochch/dataset/0514/bg_green/0/raw --cali /data/new_disk6/guochch/dataset/0514/cali/0/sparse/0
CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 100 --end 300 --data_path /data/new_disk6/guochch/dataset/0514/czl_box2 \
 --bg /data/new_disk6/guochch/dataset/0514/bg_green/0/raw --cali /data/new_disk6/guochch/dataset/0514/cali/0/sparse/0
CUDA_VISIBLE_DEVICES=2 python process_gcc.py --num 81 --start 150 --end 300 --data_path /data/new_disk6/guochch/dataset/0514/czl_box2 \
 --bg /data/new_disk6/guochch/dataset/0514/bg_green/0/raw --cali /data/new_disk6/guochch/dataset/0514/cali/0/sparse/0



CUDA_VISIBLE_DEVICES=2 python process_dataset.py --num 81 --start 0 --end 5 --data_path /data/new_disk7/dataset/release/4K_Actor1_Magic_1 \
 --bg /data/new_disk7/dataset/release/4K_Actor1_Magic_1/bg --cali /data/new_disk7/dataset/release/4K_Actor1_Magic_1/sparse/0

