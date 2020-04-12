cat >output/images/trust.ini <<EOF
[VERSION]
MAJOR=1
MINOR=0
[BL30_OPTION]
SEC=0
[BL31_OPTION]
SEC=1
PATH=output/images/rk3308_bl31_v2.22.elf
ADDR=0x00010000
[BL32_OPTION]
SEC=0
[BL33_OPTION]
SEC=0
[OUTPUT]
PATH=output/images/trust.img
EOF

output/build/rkbin-aae5f990fcf0dd604f7955cca7666b904d48ef09/tools/trust_merger --size 1024 1 output/images/trust.ini
