sudo echo "building and installing linux kernel 3.19.0"

export LOCALVERSION=""

make -j8 LOCALVERSION=""
if [ $? != 0 ]
then
	echo "make failed, halting build script"
	exit 1;
fi

sudo make -j8 modules LOCALVERSION=""
sudo make modules_install 

sudo rm /boot/initrd.img-3.19.0 /boot/config-3.19.0 /boot/vmlinuz-3.19.0 /boot/System.map-3.19.0

sudo make install && \
sudo update-grub

