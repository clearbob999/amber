# 蛋白配体预处理

## 蛋白
/TER + enter进行搜索，/TER为分隔符，删除只保留蛋白
```vi **.pdb```打开原始pdb文件
`/MISS`查看有没有断链
`/SSSBOND` 查看肽链是否存在二硫键
## 配体

 1. 将复合物上传到protein+（[https://proteins.plus/](https://proteins.plus/)），进行加氢，下载加氢后的pdb格式，删除只剩下配体
 
 2. 用amber中antechamber模块计算各原子的电荷 ``` antechamber -i ligand.pdb -fi pdb
    -o ligand.mol2 -fo mol2 -rn MOL -c bcc -nc 0 -pf ``` 上面命令解释如下:
    
     `-i` lig_h.pdb-fi pdb: -i, 参数i, 表明输入(input)； ligand_h.pdb, 输入的文件; -fi, 参数f,文件(file)格式, pdb, 表示输入的格式为pdb 。(注：该pdb文件必须包含详细的成键信 息)
     `-o` ligand1.mol2 -fo mol2: -o, 参数o, 表明输入(output)【下同】; ligand.mol2, 输出的文件;mol2,规定输出文件的格式为mol2 。
     `-c` bcc：采用的方法为bcc。
     `-nc` − nc, 电荷的数量(number of charge): 0 。（根据各自体系填写)
    `- &`：后台运行符
  完成后会产生ligand.mol2文件。
  
 3. 用parmchk模块生成小分子的键长、键角和二面角 ```parmchk2 -i ligand.mol2 -f mol2 -o ligand.frcmod```
 `-i` ligand.mol2 -f mol2输入 mol2文件;  
`-o` ligand.frcmod: 输出键长、键角和二面角frcmod文件

## 复合物

 1. `vi leap.in` 写完之后保存退出
 2. 利用Leap模块进行体系的预处理`tleap -sf leap.in`
 ## **注意**
 如果有二硫键要进行其他处理，查阅文档
