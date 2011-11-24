#!/system/bin/sh
sh /system/etc/init.qcom.sdio.sh 1
mac_param=`getprop ro.wifi.macaddr`
insmod /system/lib/modules/libra.ko $mac_param
usleep 100000
setprop wlan.driver.status "ok"
sh /system/etc/init.qcom/sdio.sh 0
