# How to install Caffe and Tensorflow on the Duckiebot {#caffe-tensorflow-install status=beta}

Caffe and TensorFlow are popular deep learning libraries, and are supported by the Intel Neural Computing Stick (NCS).

## Caffe

### Step 1: install dependencies and clone repository
Before installing Caffe, we have to install/check several dependencies first.

    sudo apt-get install -y gfortran cython

    sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler git

    sudo apt-get install --no-install-recommends libboost-all-dev

    sudo apt-get install -y python-dev libgflags-dev libgoogle-glog-dev liblmdb-dev libatlas-base-dev python-skimage

    sudo pip install pyzmq jsonschema pillow numpy scipy ipython jupyter pyyaml

Then `cd` into home directory, and clone repository.

    git clone https://github.com/BVLC/caffe
    cd caffe
    cp Makefile.config.example Makefile.config

Now you need to modify Makefile.config for duckiebot.

    vim Makefile.config

There are some parts need to edit.

Line 8:

    CPU_ONLY := 1

Line 68:

    PYTHON_INCLUDE := /usr/include/python2.7 \
                /usr/lib/python2.7/dist-packages/numpy/core/include \
                /usr/local/lib/python2.7/dist-packages/numpy/core/include

Line 95:

    INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial/
    LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/arm-linux-gnueabihf/hdf5/serial/


### Step 2: compile Caffe

    cd ~/caffe
    make all -j4
    make test
    make runtest
    make pycaffe

For using Caffe in Python, we need to add a line at the end of ~/.bashrc file.

    sudo vim ~/.bashrc
    export PYTHONPATH=/home/ubuntu/caffe/python:$PYTHONPATH

### Step 3: try it out

Using caffe time tool to load network and benchmark it layer-by-layer.

    cd ~/caffe
    ./build/tools/caffe time -model models/bvlc_alexnet/deploy.prototxt -iterations 2

Check Caffe could be imported from Python interface.

    run Python
    import sys
    caffe_root = '/home/ubuntu/caffe/'
    sys.path.insert(0, caffe_root + 'python')
    import caffe



## Tensorflow 

### Step 1: install dependencies and clone repository

First, update apt-get:

    $ sudo apt-get update

For Bazel:

    $ sudo apt-get install pkg-config zip g++ zlib1g-dev unzip

For Tensorflow:
(NCSDK only support python 3+. I didn't use mvNC on rpi3, so here I choose python 2.7)

(For Python 2.7)

    $ sudo apt-get install python-pip python-numpy swig python-dev
    $ sudo pip install wheel

(For Python 3.3+)

    $ sudo apt-get install python3-pip python3-numpy swig python3-dev
    $ sudo pip3 install wheel

To be able to take advantage of certain optimization flags:

    $ sudo apt-get install gcc-4.8 g++-4.8
    $ sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 100
    $ sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 100

Make a directory that hold all the thing you need

    $ mkdir tf


### Step 2: build Bazel

Download and extract bazel (here I choose 0.7.0):

    $ cd ~/tf
    $ wget https://github.com/bazelbuild/bazel/releases/download/0.7.0/bazel-0.7.0-dist.zip
    $ unzip -d bazel bazel-0.7.0-dist.zip

Modify some file:

    $ cd bazel
    $ sudo chmod u+w ./* -R
    
    $ nano scripts/bootstrap/compile.sh

To line 117, add "-J-Xmx500M":

<div figure-id="fig:1" >
    <img src="1.png" style='width: 33em'/>
</div>

    $ nano tools/cpp/cc_configure.bzl

Place the line return "arm" around line 133 (beginning of the _get_cpu_value function):

<div figure-id="fig:2" >
    <img src="2.png" style='width: 33em'/>
</div>

Build Bazel (it will take a while, about 1 hour):

    $ ./compile.sh

When the build finishes:

    $ sudo cp output/bazel /usr/local/bin/bazel

Run bazel check if it's working:

    $ bazel

<div figure-id="fig:3" >
    <img src="3.png" style='width: 33em'/>
</div>

### Step 3: compile Tensorflow

Clone tensorflow repo (here I choose 1.4.0):

    $ cd ~/tf
    $ git clone -b r1.4 https://github.com/tensorflow/tensorflow.git
    $ cd tensorflow
 
(Incredibly important) Changes references of 64-bit program implementations (which we don't have access to) to 32-bit implementations.

    $ grep -Rl 'lib64' | xargs sed -i 's/lib64/lib/g'

Modify the file platform.h:

    $ sed -i "s|#define IS_MOBILE_PLATFORM|//#define IS_MOBILE_PLATFORM|g" tensorflow/core/platform/platform.h

Configure the build:
(important) if you want to build for Python 3, specify /usr/bin/python3 for Python's location and /usr/local/lib/python3.x/dist-packages for the Python library path.

    $ ./configure

<div figure-id="fig:4" >
    <img src="4.png" style='width: 33em'/>
</div>

Build the Tensorflow (this will take a LOOOONG time, about 7 hrs ):

    $ bazel build -c opt --copt="-mfpu=neon-vfpv4" --copt="-funsafe-math-optimizations" --copt="-ftree-vectorize" --copt="-fomit-frame-pointer" --local_resources 1024,1.0,1.0 --verbose_failures tensorflow/tools/pip_package:build_pip_package

After finished compiling, install python wheel:

    $ bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
    $ sudo pip install /tmp/tensorflow_pkg/tensorflow-1.4.0-cp27-none-linux_armv7l.whl

Check version:

    $ python -c 'import tensorflow as tf; print(tf.__version__)'

And you're done! You deserve a break.

### Step 3: try it out

Suppose you already have inception-v3 model (with inception-v3.meta and inception-v3.ckpt)

Create a testing python file

    $ vim test.py

Write the following code:

<div figure-id="fig:5" >
    <img src="5.png" style='width: 33em'/>
</div>

Save, and excute it

    $ python test.py cat.jpg

Then it will show the predict label and predict time.
