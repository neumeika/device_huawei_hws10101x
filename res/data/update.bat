adb remount
adb push batt_fw.bin /data
adb shell "chmod 777 /data/batt_fw.bin"
adb shell "ls \"/data/batt_fw.bin\" > /sys/bus/i2c/drivers/bq27510-battery/state"

@echo off
color 0A
echo Updated OK... 
pause 
