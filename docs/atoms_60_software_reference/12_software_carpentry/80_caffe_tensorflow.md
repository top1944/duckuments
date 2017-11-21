# How to install Caffe and Tensorflow on the Duckiebot {#caffe-tensorflow-install status=beta}

Caffe and TensorFlow are popular deep learning libraries, and are supported by the Intel Neural Computing Stick (NCS).

## Caffe

### Step 1: install dependencies and clone repository
Install some of the dependencies first. The last command "sudo pip install ....." will cause some time.

    sudo apt-get install -y gfortran cython 
    sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler git
    sudo apt-get install --no-install-recommends libboost-all-dev
    sudo apt-get install -y python-dev libgflags-dev libgoogle-glog-dev liblmdb-dev libatlas-base-dev python-skimage
    sudo pip install pyzmq jsonschema pillow numpy scipy ipython jupyter pyyaml

Then, you need to clone the repo of caffe

    cd 
    git clone https://github.com/BVLC/caffe

### Step 2: compile Caffe
Before compile Caffe, you have to modify Makefile.config

    cd caffe
    cp Makefile.config.example Makefile.config
    sudo vim Makefile.config

Then, change four lines from

    '#'CPU_ONLY := 1
    /usr/lib/python2.7/dist-packages/numpy/core/include
    INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include
    LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib

to

    CPU_ONLY := 1
    /usr/local/lib/python2.7/dist-packages/numpy/core/include
    INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial/
    LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/arm-linux-gnueabihf/hdf5/serial/

Next, you can start to compile caffe 

    make all
    make test
    make runtest
    make pycaffe

If you did't get any error above, congratulation on your success.
Finally, please export pythonpath

    sudo vim ~/.bashrc
    export PYTHONPATH=/home/"$USER"/caffe/python:$PYTHONPATH 
   
### Step 3: try it out
Now, we can confirm whether the installation is successful.
Download AlexNet and run caffe time

    cd ~/caffe/
    python scripts/download_model_binary.py models/bvlc_alexnet
    ./build/tools/caffe time -model models/bvlc_alexnet/deploy.prototxt -weights  models/bvlc_alexnet/bvlc_alexnet.caffemodel   -iterations 10
    
And you can see the benchmark of AlexNet on Pi3 caffe.

## Tensorflow 

### Step 1: install dependencies and clone repository

### Step 2: compile Tensorflow

### Step 3: try it out

