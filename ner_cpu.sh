#!/bin/bash
#$ -N char-ner
#$ -q biyofiz.q@biyofiz-4-1
#$ -cwd
#$ -pe smp 18
#$ -S /bin/bash
#$ -e ../garbage/$JOB_ID.err
#$ -o ../garbage/$JOB_ID.out
#$ -M ocan13@ku.edu.tr
##$ -l h_rt=00:05:00
export LD_LIBRARY_PATH=/usr/lib64:/usr/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/mnt/kufs/scratch/ocan13/anaconda/lib:$LD_LIBRARY_PATH
export CUDA_HOME=/mnt/kufs/progs/cuda/cuda-6.5
export PATH=/mnt/kufs/progs/gcc/gcc-4.8.4/bin:$PATH
export LD_LIBRARY_PATH=/mnt/kufs/progs/gcc/gcc-4.8.4/lib64:/mnt/kufs/progs/gcc/gcc-4.8.4/lib:/usr/lib:/usr/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/mnt/kufs/progs/cuda/cuda-6.5/lib64:/mnt/kufs/progs/cuda/cuda-6.5/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/mnt/kufs/scratch/ocan13/opt/OpenBLAS/lib:$LD_LIBRARY_PATH
export CUDA_ROOT=/mnt/kufs/progs/cuda/cuda-6.5
export PATH="/mnt/kufs/scratch/ocan13/anaconda/bin:$PATH"
OMP_NUM_THREADS=18
THEANO_FLAGS=blas.ldflags="-L/mnt/kufs/scratch/ocan13/opt/OpenBLAS/lib -lopenblas",mode=FAST_RUN,device=cpu,floatX=float32,nvcc.flags=-arch=sm_30,scan.allow_gc=False python src/exper.py --activation bi-lstm bi-lstm --n_hidden 128 128 --drates 0.2 0.5 0.7 --feat basic --norm 5 --fepoch 1000 --lang ned --n_batch 32
