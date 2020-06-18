#!/bin/bash

HOME_PATH=`pwd`
PHY_PATH=~/NB-IoT/eNB
AS_PATH=~/NB-IoT/eNB
CTRL_PATH=~/NB-IoT/eNB
CTRL_SCRIPT_PATH=~/NB-IoT/eNB
MY_PASSWORD=hsng


#PHY rev 14:  -B:TX gain -b:RX gain -C freq -c freq offset -H release 13.3 -X:log level(6:info 3:error) 
#PHY rev 14:  -p: show npusch power (need -X 6) -T nprach threshold -d: xform -f TM500
PHY_COMMAND="-C 926000000L -B 89 -b 115"    #rev 14  -f TM500 -X log level 6:info 4:error


#--multitone 0(multi-tone) 3(single-tone) --scspacing 0(3.75kHz) 1(15kHz)
# case single-tone lab-3

MAC_COMMAND="--rmax 3 --gvalue 3 --candidate 8 --multitone 3 --bsrzerocount 0 --maclog 0 --rlclog 0 --rrclog 0"

# <<============= PHY Norml =====================
echo "startup III eNB PHY..."
gnome-terminal -x bash -c "cd $PHY_PATH; echo $MY_PASSWORD | sudo ./enb_phy $PHY_COMMAND; read -p \"Press any key to close terminal\""
# =============================================>>

sleep 1.5
#read -p "Press any key to start eNB AS..."
echo "startup III eNB AS..."
gnome-terminal -x bash -c "cd $AS_PATH; echo $MY_PASSWORD | sudo -S ./enb_as $MAC_COMMAND; read -p \"Press any key to close terminal\""
sleep 1
#read -p "Press any key to start eNB Ctrl..."
echo "startup III eNB Ctrl..."
gnome-terminal -x bash -c "cd $CTRL_PATH; echo $MY_PASSWORD | sudo -S ./enbctrl; read -p \"Press any key to close terminal\""
sleep 1
#echo "running III eNB Ctrl script..."
gnome-terminal -x bash -c "cd $CTRL_SCRIPT_PATH; ./enbctrl_script"
cd $HOME_PATH



