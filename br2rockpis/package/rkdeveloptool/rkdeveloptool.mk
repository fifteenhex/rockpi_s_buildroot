################################################################################
#
# rkbin
#
################################################################################

RKDEVELOPTOOL_VERSION = 6e92ebcf8b1812da02663494a68972f956e490d3
RKDEVELOPTOOL_SITE = https://github.com/rockchip-linux/rkdeveloptool.git
RKDEVELOPTOOL_SITE_METHOD = git
RKDEVELOPTOOL_AUTORECONF = YES

$(eval $(host-autotools-package))
