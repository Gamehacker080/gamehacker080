{\rtf1\ansi\ansicpg1252\cocoartf2509
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;\f1\fmodern\fcharset0 CourierNewPSMT;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww13260\viewh10200\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \expnd0\expndtw0\kerning0
#!/bin/sh\
clear\
VER="1.0~1"\
echo "
\f1 game_hacker080
\f0  restore_sileo v$VER"\
\
DIRECTORY=`dirname $0`\
\
SOURCELISTS="/private/etc/apt/sources.list.d"\
CACHEDIR="/private/var/mobile/Library/Caches/"\
\
SILEOSOURCENAME="sileo.sources"\
SILEOSOURCELISTCACHE="$CACHEDIR/$SILEOSOURCENAME"\
SILEOSOURCELIST="/private/etc/apt/sources.list.d/$SILEOSOURCENAME"\
\
SILEOLISTCACHEBACKUP="./sileocache/$SILEOSOURCENAME"\
SOURCELISTSBACKUP="./sourcelists/$SILEOSOURCENAME"\
\
if [[ $EUID -ne 0 ]]; then\
        echo "Please run this script as root!" \
        exit 1;\
fi\
\
# Change directory to directory of current shell script\
cd $DIRECTORY\
\
killall Sileo\
# Checking for Sileo installation\
echo "Checking for Sileo installation..."\
dpkg-query -W -f='$\{Status\}\\n' "org.*.sileo" | grep 'install ok' &> /dev/null\
        if [ ! $? == 0 ]; then\
                read -p "Sileo is not installed. Do you still wish to continue? [Y/N]" -n 1 -r\
                echo\
                if ! [[ $REPLY =~ ^[Yy]$ ]]; then\
                exit 1;\
                fi\
        fi\
# Restoring backup\
if [ -r $SILEOLISTCACHEBACKUP ]; then\
        echo "Copying Sileo Source Cache to $CACHEDIR ..."\
        cp -afv "$SILEOLISTCACHEBACKUP/." $CACHEDIR\
fi\
if [ -r $SOURCELISTSBACKUPDIR ]; then\
        if [ ! -d $SOURCELISTS ]; then\
        mkdir $SOURCELISTS\
        fi\
        echo "Copying Sileo Source List to $SOURCELISTS ..."\
        cp -afv "$SOURCELISTSBACKUPDIR/." $SOURCELISTS\
fi\
echo "Finished restoring Sileo Sources!"\
\
echo "Updating sources..."\
apt-get update\
\
echo "Done!"\
\
\pard\tx13155\pardeftab720\partightenfactor0
\cf0 exit 0;}