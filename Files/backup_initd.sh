#!/sbin/sh
if [ $1 -eq 1 ] #Backup mode
then 
	mount /system
	mkdir -p /tmp/etc/init.d
	cp -r /system/etc/init.d /tmp/etc
	cp /system/etc/vold.fstab /tmp/etc
	rm /tmp/etc/init.d/13cpu
	umount /system
else #Restore mode
	cp -R /tmp/etc /system
	umount /system
fi
