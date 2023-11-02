# 结合自由能计算
首先计算焓变，用到的是pbsa和gbsa方法。我们需要以下文件：pro.top，lig.top，com.top，run.sh，MM_GBSA.in

## `vi MM_GBSA.in`

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
### 计算GBSA的参数
&gb
igb = 2, # GB类型
saltcon = 0, # 带电吗
ifant = 0, # 
molsurf = 0,
surften = 0.005,
surfoff = 0
/
## 是否做残基分解
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
## 注意事项
MMGBSA和pbsa一般选200-500帧，pbsa比较慢

## `vi run.sh`

```
MMPBSA.py -O -i MM_GBSA.in -o MM_GBSA.dat -eo MM_GBSA.csv -do MM_GBSA_DECOP.dat -deo MM_GBSA_DECOMP.csv -cp com.top -rp pro.top -lp lig.top -y ../md_99.crd >MM_GBSA.log
```

## 参数说明
`-np` 2 2个core并行
`-i` MM_GBSA.in input文件
`-o` MM_GBSA.dat 结果文件
`-eo` MM_GBSA.csv 详细结果文件
`-do` MM_GBSA_DECOMP.dat 残基分解的结果文件(总的)
`-deo` MM_GBSA_DECOMP.csv 残基分解的详细结果文件(每一帧）
`-cp` com.top 复合物的 top
`-rp` pro.top 文件受体的 top
`-lp` lig.top 文件配体的 top
`-y` …/md2/md2.crd 文件轨迹文件
 

## 同时打开两个文件
```
vi MM_GBSA.dat
```
```
:sp MM_PBSA.dat
```
ctril + ww 换光标
