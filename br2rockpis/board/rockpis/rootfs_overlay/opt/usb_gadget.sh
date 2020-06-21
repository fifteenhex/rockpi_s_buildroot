#! /bin/sh

set -e

modprobe libcomposite

cd /sys/kernel/config/
cd usb_gadget
mkdir g1
cd g1
echo "0x0525" > idVendor
echo "0xA4A7" > idProduct
mkdir strings/0x409
echo "0123456789" > strings/0x409/serialnumber
echo "OmNomNom industries" > strings/0x409/manufacturer
echo "Super Duper great thing" > strings/0x409/product

mkdir functions/acm.usb0
mkdir functions/ffs.mtp

mkdir configs/c.1
mkdir configs/c.1/strings/0x409

echo "a configuration" > configs/c.1/strings/0x409/configuration

ln -s functions/ffs.mtp configs/c.1
ln -s functions/acm.usb0 configs/c.1

echo 100 > "configs/c.1/MaxPower"

mkdir /dev/ffs-umtp
mount -t functionfs mtp /dev/ffs-umtp

umtprd &

sleep 1

echo "ff400000.usb" > UDC
