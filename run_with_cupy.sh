#!/bin/bash

pip install --user cupy-cuda90

nvprof --profile-child-processes \
    -o $1/prof-gr${OMPI_COMM_WORLD_RANK}-lr${OMPI_COMM_WORLD_LOCAL_RANK}-%p.nvvp \
    python $1/examples/horovod/tf/profile_mnist.py \
        --iter 10 --use_shared_data \
        --enable_profiling_by_cupy
