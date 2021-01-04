#!/bin/sh
#mountusb.sh
#退出程序函数
quit()
{
	clear
	echo "*******************************************************************"
	echo "                          Thank you to use, Good bye!               "
	exit 0
}
#加载U盘函数
mountusb()
{
	clear
	#在/mnt下创建usb目录
	mkdir /mnt/usb
	#查看U盘设备名称
	/sbin/fdisk –l | grep /dev/sd
	echo –e "Please Enter the device name of usbas shown above:\c"
	read PARAMETER
	mount/dev/$PARAMETER /mnt/usb
}
#卸载U盘函数
umountusb()
{
	clear
	ls -la /mnt/usb
}
#显示U盘信息函数
display()
{
	clear
	umount /mnt/usb
}
#拷贝硬盘文件到U盘函数
cpdisktousb()
{
	clear
	echo –e "Please Enter the filename to beCopide (under Current directory):\c"
	read FILE
	echo "Copying,please wait!..."
	cp $FILE /mnt/usb
}
#拷贝U盘函数到硬盘文件
cpusbtodisk()
{
	clear
	echo -e "Please Enter the filename to beCopide in USB:\c"
	read FILE
	echo "Copying ,Please wait!..."
	cp /mnt/usb/$FILE .  #点(.)表示当前路径
}
 
clear
while true
do
	echo "====================================================================="
	echo "***           LINUX USB MANAGE PROGRAM                            ***"
	echo  "             1-MOUNT USB                                    "
	echo  "             2-UNMOUNT USB                                  "
	echo  "             3-DISPLAY USB INFORMATION                      "
	echo  "             4-COPY FILE IN DISK TO USB                     "
	echo  "             5-COPY FILE IN USB TO DISK                     "
	echo  "             0-EXIT                                         "
	echo "====================================================================="
 
	echo–e "Please Enter a Choice(0-5):\c"
	read CHOICE
	case $CHOICE in
	1)  mountusb
	2)  unmountusb
	3)  display
	4)  cpdisktousb
	5)  cpusbtodisk
	0)  quit
	*)  echo "Invalid Choice!Corrent Choice is (0-5)"
		sleep 4
		clear;;
	esac
done
