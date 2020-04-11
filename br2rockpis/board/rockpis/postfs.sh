#!/bin/sh

cp output/build/linux-stable-4.4-rockpis/arch/arm64/boot/dts/rockchip/overlay/rk3308-console-on-uart0.dtbo \
	output/images

/media/fatboy/coding/rockpi_s_buildroot/br2rockpis/board/rockpis/mkidbloaderimg.sh
pwd
support/scripts/genimage.sh -c $BR2_EXTERNAL_ROCKPIS_PATH/board/rockpis/genimage.cfg

