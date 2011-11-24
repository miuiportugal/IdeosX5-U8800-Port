#!/sbin/sh
echo \#!/sbin/sh > /tmp/createnewboot.sh
mkdir /cust
mount cust
/tmp/unpackbootimg -i /cust/image/boot.img -o /tmp/
echo /tmp/mkbootimg --kernel /tmp/zImage --ramdisk /tmp/boot.img-ramdisk.gz --cmdline \"$(cat /tmp/boot.img-cmdline)\" --base $(cat /tmp/boot.img-base) --pagesize $(printf "%d" 0x`cat /tmp/boot.img-pagesize`) --output /tmp/newboot.img >> /tmp/createnewboot.sh
chmod 777 /tmp/createnewboot.sh
/tmp/createnewboot.sh
cp /tmp/newboot.img /cust/image/boot.img
return $?
