#!/system/bin/sh
MODDIR=${0%/*}
time=$(date +%Y%m%d-%H%M%S)
path=/data/local/boot
file=$path/boot-post-fs-data-$time.log
android_sdk=`getprop ro.build.version.sdk`
build_desc=`getprop ro.build.description`
product=`getprop ro.build.product`
manufacturer=`getprop ro.product.manufacturer`
brand=`getprop ro.product.brand`
fingerprint=`getprop ro.build.fingerprint`
arch=`getprop ro.product.cpu.abi`
device=`getprop ro.product.device`
android=`getprop ro.build.version.release`
build=`getprop ro.build.id`
mkdir -p $path
rm -f $file
touch $file
echo "--------- beginning of head">>$file
echo "MyLogcat">>$file
echo "--------- beginning of system info">>$file
echo "Android version: ${android}">>$file
echo "Android sdk: ${android_sdk}">>$file
echo "Android build: ${build}">>$file
echo "Fingerprint: ${fingerprint}">>$file
echo "ROM build description: ${build_desc}">>$file
echo "Architecture: ${arch}">>$file
echo "Device: ${device}">>$file
echo "Manufacturer: ${manufacturer}">>$file
echo "Brand: ${brand}">>$file
echo "Product: ${product}">>$file
echo "--------- beginning of dmesg">>$file
dmesg>>$file
echo "--------- beginning of SELinux">>$file
getenforce>>$file
echo "--------- beginning of ps">>$file
ps -A>>$file
logcat -v threadtime *:V>>$file &
anim="getprop init.svc.bootanim"
boot="getprop sys.boot_completed"
while [[ $($anim) != stopped || $($boot) -ne 1 ]]
do
  sleep 1
done
# wait for writting buffered log
sleep 30
pkill logcat
echo "Boot completed">>$file
