#!/bin/bash

#$-l rt_G.small=1
#$-l h_rt=00:30:00
#$-j y
#$-cwd

source /etc/profile.d/modules.sh

module load python/3.6/3.6.5 cuda/9.0/9.0.176.4 cudnn/7.2/7.2.1 nccl/2.3
export LD_LIBRARY_PATH=$CUDA_HOME/extras/CUPTI/lib64:$LD_LIBRARY_PATH

if [ ! -e work_venv ]; then
    python3 -m venv work_venv
fi
source work_venv/bin/activate
pip3 install tensorflow-gpu==1.12.0

python3 -c "from tensorflow import keras; keras.datasets.mnist.load_data('MNIST-data')"
