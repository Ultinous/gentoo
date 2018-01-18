# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="NVIDIA cuDNN GPU Accelerated Deep Learning"
HOMEPAGE="https://developer.nvidia.com/cudnn"
SRC_URI="cudnn-9.0-linux-x64-v7.tgz"
RESTRICT="fetch"
S="${WORKDIR}/cuda"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="
	=dev-util/nvidia-cuda-toolkit-9.0*
	!dev-libs/cudnn
"

pkg_nofetch() {
	einfo "Please download"
	einfo "  - ${SRC_URI}"
	einfo "from ${HOMEPAGE} and place them in ${DISTDIR}"
}

src_install() {
	dolib.so lib64/libcudnn*.so*
	dolib.a lib64/libcudnn_static.a
	doheader include/cudnn.h
}
