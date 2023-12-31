#!/bin/bash
PKG="termux-api"
PKG2="figlet"
dpkg -s $PKG &> /dev/null && dpkg -s $PKG2 &> /dev/null
if [ $? -eq 1 ] 
then
    apt install $PKG -y
    clear
    apt install $PKG2 -y
    clear
    bash $0

else
clear
figlet -f digital -c 'WildInsect' 
echo '-------------------------------------'
echo "Select any command to exicute."
echo '-------------------------------------'
echo "(1)wifi-ScanInfo"
echo "(2)WiFi(ON)"
echo "(3)WiFi(OFF)"
echo "(4)Torch(on)"
echo "(5)Torch(off)"
echo "(6)Battery-Status"
echo "(7)Make-Call"
echo "(8)Send-SMS"
echo "(7)Call-Log"
echo "(9)Contact-List"
echo "(10)SMS-List"
echo "(11)Fingerprint Auth"
echo "(12)Vibrate"
echo "(13)Take-Photo"
echo "(14)Current-Location"
echo "(15)Change Walpaper"
echo "(16)Camera-Info"
echo "(17)Telephony-Deviceinfo"
echo "(18)Telephony-CellInfo"
echo "(19)WiFI-Connection-Info"
echo "(20)Dialog-Box"
echo "*********** Enter CTRL+c for Exit ***********"
echo
read -p 'Select one: ' CMD
if [ "$CMD" = "1" ]
then
        clear
        echo "$(termux-wifi-scaninfo)"

elif [ "$CMD" = "2" ]
then
        clear
        echo "$(termux-wifi-enable true)"
        echo 'Done :)'

elif [ "$CMD" = "3" ]
then
        clear
        echo "$(termux-wifi-enable false)"
        echo 'Done :)'

elif [ "$CMD" = "4" ]
then
        clear
        echo "$(termux-torch on)"
        echo 'Done :)'

elif [ "$CMD" = "5" ]
then
        clear
        echo "$(termux-torch off)"
        echo 'Done :)'

elif [ "$CMD" = "6" ]
then
        clear
        echo "$(termux-battery-status)"

elif [ "$CMD" = "7" ]
then
        clear
        read -p "Enter a No:+91 " NO
        if [[ -z "${NO//[0-9]/}" ]]
        then
        echo "$(termux-telephony-call $NO)"
	echo "Done :)"
        else 
        echo "Invalid Number!!"
        fi
elif [ "$CMD" = "8" ]
then
        clear
	read -p "Enter Number:+91 " NO
	read -p "Enter Messege: " MSG
	if [[ -z "${NO//[0-9]/}" ]]
	then
	echo "$(termux-sms-send -n $NO $MSG)"
	echo "Done :)"
	else
	echo "Invalid Number !!"
	fi
elif [ "$CMD" = "9" ]
then
        clear
        echo "$(termux-contact-list)"

elif [ "$CMD" = "10" ]
then
        clear
        echo "$(termux-sms-list)"

elif [ "$CMD" = "11" ]
then
        clear
        echo "$(termux-fingerprint)"

elif [ "$CMD" = "12" ]
then
        clear
        read -p "Enter duration(in second): " TM
	TIME=$(($TM*1000))
	if [[ -z "${TM//[0-9]/}" ]]
	then
	echo "$(termux-vibrate -f -d $TIME)"
        else
	echo "Invalid!!"
	echo 'Done :)'
	fi

elif [ "$CMD" = "13" ]
then
        clear
	echo "(1) Front Camera"
	echo "(2) Rear Camera"
	read -p "Select one(Ex. 1 OR 2): " CID
        if [[ $CID -eq 1 ]]
	then
	echo "$(termux-camera-photo -c 1 capture_img/$(date +"%FT%H%M%S")Front.jpg)"
	echo "Image saved into : capture_img/$(date +"%FT%H%M%S")Front.jpg"
        echo 'Dome :)'
	else
	echo "$(termux-camera-photo -c 0 capture_img/$(date +"%FT%H%M%S")Rear.jpg)"
	echo "Image saved into : capture_img/$(date +"%FT%H%M%S")Rear.jpg"	
	echo 'Dome :)'
	fi
elif [ "$CMD" = "14" ]
then
        clear
        echo "$(termux-location)"

elif [ "$CMD" = "15" ]
then
        clear
       	read -p "Select Wallpaper Locatio(Ex. /location/img.jpg): " LOC
	echo "(1) Home Screan"
	echo "(2) Lock Screan"
	read -p "Select one(1 OR 2): " SCN
	if [[ $SCN -eq 1 ]]
	then
		echo "$(termux-wallpaper -f $LOC)"
		echo "Done :)"
	else
		echo "$(termux-wallpaper -l -f $LOC)"
		echo "Done :)"
	fi
elif [ "$CMD" = "16" ]
then
        clear
        echo "$(termux-camera-info)"

elif [ "$CMD" = "17" ]
then
        clear
        echo "$(termux-telephony-deviceinfo)"

elif [ "$CMD" = "18" ]
then
        clear
        echo "$(termux-telephony-cellinfo)"
        
elif [ "$CMD" = "19" ] 
then
        clear
        echo "$(termux-wifi-scaninfo)"

elif [ "$CMD" = "20" ] 
then
        clear
        echo "$(termux-dialog)"

else
        clear
        echo " Please run script again! select a valid option."
fi
fi
