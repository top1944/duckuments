# Installing Ubuntu on laptops {#setup-laptop status=beta}

Assigned: Andrea

Before you prepare the Duckiebot, you need to have a laptop with Ubuntu installed.

<div class='requirements' markdown='1'>

Requires: A laptop with free disk space.

Requires: Internet connection to download the Ubuntu image.

Requires: About 30 minutes.

Results: A laptop ready to be used for Duckietown.

</div>

## Install Ubuntu

Install Ubuntu 16.04.3.

See: For instructions, see for example [this online tutorial][tutorial].

[tutorial]: https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop

**On the choice of username:**  During the installation, create a user for yourself with a username different from `ubuntu`, which is the default. Otherwise, you may get confused later.

<!--
I chose the following options:

        language: English
        username: ubuntu
        password: ubuntu
        hostname: duckietop

If you choose a different username, you will need to change all the commands later. -->


### Install Ubuntu on Macbook

The following steps are taken from [Nilen Maschke]'s notes with modication, works well on Macbook Pro Retina 2015 using OS X Yosemite (10.10.5). **Warning:Backup all your data before proceeding.**

1. Create a bootable USB drive
    + Prepare a spare USB drive with sufficient capacity (>=4GB), plug into your computer, backup anything on the drive. 
    + Open **Disk Utility** (in /Application/Utilities/), erase the USB drive, give it a name and choose **MS-DOS(FAT)** as the **Format**, if there is a ''Scheme'' option, ignore it. 
    + Open Terminal, run  
     
	    ```
	    diskutil list
	    ```
		This would print out a list of your drives and their partitions, remember your USB drive's location,`dev/diskN`, for example, `/dev/disk2`, then unmount it by using the following command in terminal: 
		
	    ```
	    diskutil unmountDisk /dev/diskN
	    ```
    + Download ISO image from Ubuntu's official website <https://www.ubuntu.com/download/desktop>, then convert it to dmg file so the OS X would recognize, by running the following command in terminal:
		
		```
hdiutil convert -format UDRW -o /path/to/image.dmg /path/to/downloaded/ubuntu-16.04.3-desktop-amd64.iso
		```
    	 Here please replace a ''/path/to/downloaded/ubuntu-16.04.3-desktop-amd64.iso'' and ''/path/to/image.dmg'' with the actual location to your downloaded file and your intended dmg file location 
    	 
    	 
    + Now we clone this image to the usb drive, by running the following command in terminal: 
     
	    ```
		sudo dd if=/path/to/image.dmg of=/dev/rdiskN
	    ```
	    
   	   Remember to replace the '/path/to/image.dmg' with your actual dmg path you have in the last step. Here we use ''rdiskN'' instead of ''diskN'' because the former basically just writes the data from the start of the disk, whereas the latter has to pass through more
layers of software abstraction. It will take a while.  
		The Finder might complain that the drive is not able to read, just click **ignore**.


2. Partitioning your Mac  
    + Open Disk Utility again, select your built in drive, hit **partition** tab
    + Under the **Partition Layout**, hit the **+** button, use your mouse or trackpad to adjust the size of partition (ideally >=50GB for Duckietown), name it (for example: Ubuntu1604), and choose **MS-DOS (FAT)** (You will change that later when install ubuntu), then hit **"Apply"**, it would take a few minutes and your computer will be extremely slow/unresponsive at this time. Your data in this drive should be unaffected, but always backup before doing this tutorial, weird thing can and did happen, and you might have to erase the entire disk to reinstall Mac OS. 

3. Installing Ubuntu
    + Insert the USB drive, restart your mac, hold down the **Option** key until you see a grey screen asking you to select **Macintosh HD**, or two **EFI Boot**, select either the later two will bring you a black screen with a few options, click **Install Ubuntu**
    + Check **Download updates while installing** and **Install this third-party software**, hit **continue**
    + Proceed till you get to the **Installation type** page, STOP, select **Something else**. This will bring you to the partition eidtor for ubuntu, find the partition you create on you Mac, click **-** on it, it will turn to free space.  
      Now we create the swap partition for the RAM, select the **free space**, hit **+**, choose size to be the same as your RAM, "Type for the new partition" should be **Primary**, "Location for the new partition" would be **Begnning of this space**, and "Use as"
**swap area**, click **OK**.  
      Then we create the actual partition for ubuntu, select the **free space**, hit **+**, letting the size be as large as remainingg free space, select use as **ext4 journaling file system**, and the mount point **/**  (a single slash).  
      Select the ext4 partition you just created to be "Device for boot loader installation", hit **continue**.
    + Now proceed with the rest of installation, choosing region username etc. And choose to restart when the installation completes.
      
4. Getting back to Mac  
    Now you will be directed to Ubuntu16.04 everytime you start/restart your computer, if you want to go back to Mac OS, press **option** when you start your macbook, then choose **Macintosh HD**, you will be using Mac OS again.
 



[Nilen Maschke]:http://courses.cms.caltech.edu/cs171/materials/pdfs/How_to_Dual-Boot_OSX_and_Ubuntu.pdf




<!--
http://courses.cms.caltech.edu/cs171/materials/pdfs/How_to_Dual-Boot_OSX_and_Ubuntu.pdf
-->





## Install useful software

Use `etckeeper` to keep track of the configuration in `/etc`:

    laptop $ sudo apt install etckeeper

Install `ssh` to login remotely and the server:

    laptop $ sudo apt install ssh

Use `byobu`:

    laptop $ sudo apt install byobu

Use `vim`:

    laptop $ sudo apt install vim

Use `htop` to monitor CPU usage:

    laptop $ sudo apt install htop

Additional utilities for `git`:

    laptop $ sudo apt install git git-extras

Other utilities:

    laptop $ sudo apt install avahi-utils ecryptfs-utils


## Install ROS

Install ROS on your laptop.

See: The procedure is given in [](#install-ROS).


## Other suggested software

### Redshift

This is Flux for Linux. It is an accessibility/lab safety issue: bright screens damage eyes and perturb sleep [](#bib:tosini16).

<cite id='bib:tosini16'>
    Tosini, G., Ferguson, I., Tsubota, K. <em>Effects of blue light on the circadian system and eye physiology</em>. Molecular Vision, 22, 61–72, 2016 (<a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4734149/">online</a>).
</cite>

Install redshift and run it.

    laptop $ sudo apt install redshift-gtk

Set to "autostart" from the icon.

## Installation of the duckuments system

Optional but very encouraged: install the duckuments system.
This will allow you to have a local copy of the documentation
and easily submit questions and changes.

See: The procedure is documented in [](#sub:installing-docs-system).


## Passwordless `sudo`

Set up passwordless `sudo`.

See: This procedure is described in [](#howto-passwordless-sudo).


Comment: Huh I don't know - this is great for usability, but horrible for security. If you step away from your laptop for a second and don't lock the screen, a nasty person could `sudo rm -rf /`. -FG

## SSH and Git setup


### Basic SSH config

Do the basic SSH config.

See: The procedure is documented in [](#ssh-local-configuration).


### Create key pair for `![username]`

Next, create a private/public key pair for the user; call it `![username]@![robot name]`.

See: The procedure is documented in [](#howto-create-key-pair).

### Add `![username]`'s public key to Github

Add the public key to your Github account.

See: The procedure is documented in [](#howto-add-pubkey-to-github).

If the step is done correctly, this command should succeed:

    duckiebot $ ssh -T git@github.com

### Local Git setup

Set up Git locally.

See: The procedure is described in [](#howto-git-local-config).
