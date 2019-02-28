#!/bin/bash

#$-l rt_F=1
#$-l h_rt=00:30:00
#$-j y
#$-cwd

if [ $# -ne 2 ]; then
    echo "Unexpected args."
    echo "$0 <singularity image path> <num_gpus>"
    exit 1
fi

readonly local SINGULARITY_IMAGE_PATH=$1
if [ ! -e ${SINGULARITY_IMAGE_PATH} ]; then
    echo "${SINGULARITY_IMAGE_PATH} not found."
    exit 2
fi
readonly local N_GPUS=$2

source /etc/profile.d/modules.sh
module load singularity/2.6.1 openmpi/3.0.3

echo "$(date) start profiling."

mpirun -np ${N_GPUS} singularity exec --nv ${SINGULARITY_IMAGE_PATH} \
    bash $(pwd)/run_with_cupy.sh $(pwd)

echo "$(date) end profiling."
