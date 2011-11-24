#!/bin/sh
# MIUI u8800 port script by rtfpessoa based on Stockwell's

rom="ROM-LOCATION"
patch="PATCH-LOCATION"
ver="VERSION"

# set up the kitchen
mkdir kitchen
unzip $rom -d kitchen
cd kitchen

#Remove Some Not Needed Files
    # /bin
    cd system/bin
    rm akmd
    rm bma150_usr
    rm fmradioserver
    rm htc_ebdlogd
    cd ..

    # /etc
    cd etc
    rm firmware/Vision_SPK.acdb
    rm firmware/bcm4329.hcd
    rm firmware/default*
    rm A1026_CFG.csv
    rm AdieHWCodec*.csv
    rm T-Mobile_USA*
    rm ecclist_for_mcc.conf
    cd ..

    # /lib
    cd lib
    rm -R hw
    rm -R egl
    rm -R modules
    rm libfm*
    rm libhtc*
    rm librilswitch.so
    cd ..

    # /usr
    cd usr
    rm keychars/vision*
    rm keylayout/vision*
    rm keylayout/h2w_headset.kl
    cd ..

    # /vendor
    rm -r vendor
    cd ..

    # others
    rm -r META-INF
    rm -f system/app/FM.apk
    rm -f boot.img
    cd ..

# copy some the patches
cp -r $patch/Files/* kitchen/

# zip the rom
cd kitchen
zip -r "miuiportugal_u8800_"$ver"_AIO" *
cd

echo "DONE!!""