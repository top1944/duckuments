# Movidius Neural Compute Stick Install {#ncsdk-install status=draft}

## How to

1. create and train model in tensorflow or caffe
2. compile the model into NC format
3. move model onto duckiebot and run with NCSDK

## Laptop Installation
install based on [ncsdk website](https://movidius.github.io/ncsdk/install.html)


    git clone http://github.com/Movidius/ncsdk
    cd ~/ncsdk
    make install
    make examples


test installation

    cd ~/ncsdk/examples/app/hello_ncs_py/
    make run


## Duckiebot Installation

you only need to install the NCSDK but there is also the option of installing Caffe and/or Tensorflow as well, in order to perhaps speed up the development cycle. I would recommend against it, as it can be a bigger problem than it solves.

### Barebones Install (recommended)
you don't need tensorflow, caffe, or any tools in order to run the compiled networks and not installing them will save you a lot of hassle

on duckiebot:

    git clone http://github.com/Movidius/ncsdk
    cd ~/ncsdk

edit the conf to not install caffe or tensorflow

    nano ~/ncsdk/ncsdk.conf

    sudo make install


### Caffe/Tensorflow Install

Note: if you want to be able to compile your models on the duckiebot itself, install tensorflow or caffe beforehand and remember to install for python 3 (`pip3`)

follow directions [here](#caffe-tensorflow-install)

make sure caffe and tensorflow as installed

    python3 -c 'import tensorflow as tf; import caffe'


install ncsdk:

    git clone http://github.com/Movidius/ncsdk
    cd ~/ncsdk
    make install
    make examples


