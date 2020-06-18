#!/bin/bash

HOME_PATH=`pwd`
PHY_PATH=/home/hsng/NB-IoT/eNB
AS_PATH=/home/hsng/NB-IoT/eNB
CTRL_PATH=/home/hsng/NB-IoT/eNB
CTRL_SCRIPT_PATH=/home/hsng/NB-IoT/eNB
MY_PASSWORD=hsng


# <<============= PHY Norml =====================
echo "stop III eNB PHY..."
echo $MY_PASSWORD | sudo -S pkill enb_phy


# ============================================>>

sleep 1.5

echo "stop III eNB AS..."
echo $MY_PASSWORD | sudo -S pkill enb_as
sleep 1


echo "stop III eNB Ctrl..."
echo $MY_PASSWORD | sudo -S pkill enbctrl
sleep 1



