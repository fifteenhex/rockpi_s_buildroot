#!/bin/sh

set -e

cp output/build/linux-stable-4.4-rockpis/arch/arm64/boot/dts/rockchip/overlay/rk3308-console-on-uart0.dtbo \
	output/images

output/build/rkbin-aae5f990fcf0dd604f7955cca7666b904d48ef09/tools/loaderimage \
	--pack \
	--uboot output/images/u-boot-dtb.bin \
	output/images/uboot.img \
	0x600000 \
	--size 1024 1

$BR2_EXTERNAL_ROCKPIS_PATH/board/rockpis/mkidbloaderimg.sh
$BR2_EXTERNAL_ROCKPIS_PATH/board/rockpis/mktrustimg.sh

support/scripts/genimage.sh -c $BR2_EXTERNAL_ROCKPIS_PATH/board/rockpis/genimage.cfg

