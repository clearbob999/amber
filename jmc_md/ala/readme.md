# 丙氨酸扫描
在带电残基上引入一个或几个丙氨酸，观察这些改变对蛋白功能的影响。置换成丙氨酸，去除了侧链上的活性基团，换成了体积小、无其他官能团的甲基，同时对蛋白质结构的影响较小。若换成侧链更小的甘氨酸，因其a-碳没有手性，可能对蛋白结构有较大影响，一般不用（置换成Ala的原因：主要是Ala在二级结构中的结构能（conformational potency）高，Ala是Pa=1.42，另外经常用的还有Leu，pa=1.21，也就是所这两种氨基酸残基对二级结构的稳定性贡献更大，因此在二级结构中出现的几率更高）。

丙氨酸与其他氨基酸的不同就在于R基的不同（如下图所示），所以在进行丙氨酸扫描时，只需将原来氨基酸的R基信息进行修改即可替换为丙氨酸。
## 需要文件
轨迹文件`md.crd`
参数文件`mm_pbsa.in`
lig.top pro.top com.top
lig_mut.top  ## 不需要改变
pro_mut.top com_mut.top  ## 需要改变的

 1. 对pro_mutant.pdb文件在需要替换成丙氨酸的位置（一般是前面能量分解后比较重要的氨基酸）进行修改，只需将某残基的CA，C，N原子保留，其他的删除，并将残基名称改为ALA。经过leap后，原来的残基就被替换为丙氨酸，得到了突变后的top信息（lig_mut.toppro_mut.top com_mut.top）。`vi pro_mutant.pdb` 这是未修改的蛋白文件，现在我们需要把338号残基SER突变为ALA
![输入图片说明](/imgs/2023-11-02/Rk7zxAgvWEFB4Ar5.png)
ctrl + v 然后往下拉，往右拉选择需要替换的的残基，按s后输入ALA按两下esc就会批量填充。`:wq`保存后退出
 2. `tleap -sf leap.in`   此时生成的`pro_mut.top` `lig_mut.top`
    `com_mut.top`才是丙氨酸扫描需要的top文件
 3. `vi run.sh`
 ```
MMPBSA.py -O  -i mm_gbsa_ala.in -cp com.top -rp pro.top -lp lig.top -y ../md_99.crd  -mc com_mut.top -mr pro_mut.top &
```
-cp 参考的未突变的complex的top
-rp 参考的未突变的蛋白的top
-lp 参考的未突变的配体的top
-y 参考的轨迹文件
-mc 参考的突变的complex的top
-mr 参考的突变的蛋白的top
提交丙氨酸扫描任务 `nohup ./run.sh &`
生成的一系列文件中，FINAL_RESULTS_MMPBSA.dat是最终的统计结果
vim FINAL RESULTS MMPBSA.dat
![输入图片说明](/imgs/2023-11-02/kA2kOB7xoED13DQG.png)

