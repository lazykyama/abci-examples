```
$ git clone https://github.com/ohtaman/abci-examples.git
$ cd abci-examples/examples/horovod/keras
$ ./install.sh
$ qsub -g <your_group_id> job.sh
```

Run the following commands to run an example for profiling multiple GPU workload.

```
$ git clone https://github.com/lazykyama/abci-examples.git
$ cd abci-examples/
$ export SINGULARITY_DOCKER_USERNAME='$oauthtoken'
$ export SINGULARITY_DOCKER_PASSWORD=<Your NGC API key>
$ singularity build <Singularity image name> <Docker image>
$ qsub -g <your_group_id> prepare_mnist_profile_sample.sh
$ qsub -g <your_group_id> multigpu_prof_test.sh <Singularity image path> <#GPUs>
```

Note that you need to get an account on NGC ( http://ngc.nvidia.com ) although you can pull almost all of docker image from NGC repository when you dont' use Singularity. The information about NGC and Singularity is here ( https://docs.nvidia.com/ngc/ngc-user-guide/singularity.html ).
These profiling example scripts have been checked by `nvcr.io/nvidia/tensorflow:18.08-py3` based image.
