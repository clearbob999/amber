#!/bin/bash
###CPU
#sander -O -i min1.in -p pep.top -c pep.crd -o min1.out -r min1.rst -ref pep.crd < /dev/null
#sander -O -i min2.in -p pep.top -c min1.rst -o min2.out -r min2.rst < /dev/null
#sander -O -i md0.in -p pep.top -c min2.rst -o md0.out -x md0.crd -r md0.rst  -ref min2.rst < /dev/null
#sander -O -i md1.in -o md1.out -p pep.top -c md0.rst -r md1.rst -x md1.crd  < /dev/null
#sander -O -i md2.in -o md2.out -p pep.top -c md1.rst -r md2.rst -x md2.crd  < /dev/null
###CPU_MPI
#mpirun -np 2 sander.MPI -O -i min1.in -p pep.top -c pep.crd -o min1.out -r min1.rst -ref pep.crd < /dev/null
#mpirun -np 2 sander.MPI -O -i min2.in -p pep.top -c min1.rst -o min2.out -r min2.rst < /dev/null
#mpirun -np 8  sander.MPI -O -i md0.in -p pep.top -c min2.rst -o md0.out -x md0.crd -r md0.rst -ref min2.rst < /dev/null
#mpirun -np 2 sander.MPI -O -i md1.in -o md1.out -p pep.top -c md0.rst -r md1.rst -x md1.crd < /dev/null
#mpirun -np 2 sander.MPI -O -i md2.in -o md2.out -p pep.top -c md1.rst -r md2.rst -x md2.crd < /dev/null
###GPU

export CUDA_VISIBLE_DEVICES=1  #指定跑模拟的GPU型号为1号（具体看情况）
#pmemd.cuda -O -i min1.in -p pep.top -c pep.crd -o min1.out -r min1.rst -ref pep.crd < /dev/null
#pmemd.cuda -O -i min2.in -p pep.top -c min1.rst -o min2.out -r min2.rst -ref < /dev/null
#pmemd.cuda -O -i heat.in -p pep.top -c min2.rst -o heat.out -x heat.crd -r heat.rst -ref min2.rst < /dev/null
#pmemd.cuda -O -i md1.in -o md1.out -p pep.top -c md0.rst -r md1.rst -x md1.crd < /dev/null
#pmemd.cuda -O -i md2.in -o md2.out -p pep.top -c md1.rst -r md2.rst -x md2.crd < /dev/null

###恒压平衡
pmemd.cuda -O -i press.in -o md_press.out -p pep.top -c heat.rst -r md_press.rst -x md_press.crd -ref heat.rst < /dev/null
###全局平衡
#pmemd.cuda -O -i eq.in -o md_eq.out -p pep.top -c md_press.rst -r md_eq.rst -x md_eq.crd < /dev/null
###正式模拟
#pmemd.cuda -O -i md_99.in -o md_99.out -p pep.top -c md_eq.rst -r md_99.rst -x md_99.crd < /dev/null
