sudo echo "building and installing linux kernel 3.19.0"

export LOCALVERSION=""

make -j16 LOCALVERSION=""
if [ $? != 0 ]
then
	echo "make failed, halting build script"
	exit 1;
fi

make -j16 modules LOCALVERSION=""
sudo make modules_install LOCALVERSION=""

sudo rm /boot/initrd.img-3.19.0 /boot/config-3.19.0 /boot/vmlinuz-3.19.0 /boot/System.map-3.19.0

sudo make install LOCALVERSION="" && \
sudo update-grub

