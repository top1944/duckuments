# Jupyter  {#jupyter status=draft}

## Installation {#jupyter-install}

Remove previous installations:

    $ sudo apt remove ipython ipython-notebook

Then run:

    $ pip install --user jupyter IPython==5.0


Check the versions are correct:

    $ which ipython

    /home/andrea/.local/bin/ipython

Check the version is correct:

    $ ipython --version

    5.0.0

## Configuration

Set a password:

    $ jupyter notebook password

## Running it

    $ ipython notebook --notebook-dir=$DUCKIETOWN_ROOT/catkin_ws/src/75-notebooks
