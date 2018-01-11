To run on gird world:
Step-1: Setting up our customized gym environment

We need lot of dependencies, so, it’s better to create a new environment
conda create --name neural python=3.6 (The A3C + NTM code only works with python3)
source activate neural

pip install gym

pip install matplotlib

pip install scipy

git clone https://github.com/deepmind/pycolab.git

pip install -e .
pip install visdom
git clone https://github.com/aalitaiga/gym-duckietown
cd gym-duckietown
pip install -e .

Step-2: Cloning our A3C+NTM codes
https://github.com/tristandeleu/pytorch-a3c
git clone https://github.com/tristandeleu/pytorch-a3c
source activate neural
pip install tensorflow-gpu
pip install tensorboardX
conda install pytorch torchvision cuda80 -c soumith (see. http://pytorch.org/)

Step-3: We are ready to train now:
python main.py
Right now, you can see the total reward at the end of every episode. This will soon be updated with better visualizations
