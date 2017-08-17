# Git LFS {#git-lfs}

This describes Git LFS.

## Installation {#git-lfs-install}


See instructions at:

> [https://git-lfs.github.com/](https://git-lfs.github.com/)

## Ubuntu 16 installation

Following [these instructions](https://github.com/git-lfs/git-lfs/wiki/Installation),
run the following:

    $ sudo add-apt-repository ppa:git-core/ppa
    $ curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
    $ sudo apt update
    $ sudo apt-get install git-lfs

<!-- $ git lfs install -->


### Troubleshooting

Symptom: The binaries are not installed.

If you have installed LFS after pulling the repository and you see
only the pointer files, do:

    $ git lfs pull --all
