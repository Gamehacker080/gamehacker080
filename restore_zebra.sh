{\rtf1\ansi\ansicpg1252\cocoartf2509
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww13260\viewh10200\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \expnd0\expndtw0\kerning0
#!/bin/sh\
\
clear\
VER="1.0"\
echo "game_hacker080 restore_zebra v$VER"\
\
DIRECTORY=`dirname $0`\
ZEBRADIR="/private/var/mobile/Documents/xyz.willy.Zebra"\
ZEBRABACKUPDIR="./zebra"\
\
ZEBRABUNDLEID="xyz.willy.zebra"\
\
# Checking for Zebra installation\
echo "Checking for Zebra installation..."\
dpkg-query -W -f='$\{Status\}\\n' "$ZEBRABUNDLEID" | grep 'install ok' &> /dev/null\
        if [ ! $? == 0 ]; then\
                read -p "Zebra is not installed. Do you still wish to continue? [Y/N]" -n 1 -r\
                echo\
                if ! [[ $REPLY =~ ^[Yy]$ ]]; then\
                exit 1;\
                fi\
        fi\
\
killall Zebra\
\
cd $DIRECTORY\
\
echo "Restoring Zebra backup..."\
if [ ! -d $ZEBRADIR ]; then\
    mkdir $ZEBRADIR\
fi\
cp -afv "$ZEBRABACKUPDIR/." $ZEBRADIR\
echo "Finished restoring Zebra sources!"\
exit 0;}