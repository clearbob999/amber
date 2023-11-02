MMPBSA
```
## 所用轨迹的参数
&general
startframe = 1, ## 帧的开始
endframe = 400,  ## 帧的结束
interval=40,   ## 帧间隔
use_sander =1, # 
netcdf=1, ##轨迹是压缩格式吗
keep_files=0,  ## 是否保存中间文件
debug_printlevel = 0,
verbose = 1,
entropy = 0  ## 是否计算熵
/
&pb
indi=1,
exdi=80.0
inp=1
cavity_offset=0.92,
scale=2.0,
istrng=0.1,
linit=1000,
prbrad=1.4,
radiopt=0
/

&decomp
idecomp=1,
dec_verbose=0
/

## 是否用nmode计算熵变
#&nmode
#nmstartframe =1,
#nmendframe =10,
#nminterval =1,
#dielc = 1,
#maxcyc = 500000,
#drms = 0.001,
#nmode_igb =0 
#/

```

## `vim run.sh`
```
MMPBSA.py -O -i MM_PBSA.in -o MM_PBSA.dat -eo MM_PBSA.csv -do MM_PBSA_DECOP.dat -deo MM_PBSA_DECOMP.csv -cp com.top -rp pro.top -lp lig.top -y ../md_99.crd >MM_PBSA.log
```
## 运行
```
nohup ./run.sh &
```
