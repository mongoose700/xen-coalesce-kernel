M_TO_BUILD="drivers/block/xen-blkback/"
sudo echo "building and installing module in $M_TO_BUILD"

export LOCALVERSION=""
export M=$M_TO_BUILD
export INSTALL_MOD_DIR="kernel/drivers/block/xen-blkback/"

make -j8 LOCALVERSION="" M=$M_TO_BUILD modules
if [ $? != 0 ]
then
	echo "make failed, halting build script"
	exit 1;
fi

sudo make LOCALVERSION="" M=$M_TO_BUILD INSTALL_MOD_DIR=$INSTALL_MOD_DIR modules_install 
