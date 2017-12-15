# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="High-performance deep learning inference optimizer and runtime"
HOMEPAGE="https://developer.nvidia.com/tensorrt"
SRC_URI="TensorRT-3.0.1.Ubuntu-16.04.3.x86_64.cuda-9.0.cudnn7.0.tar.gz"
RESTRICT="fetch"
S="${WORKDIR}/TensorRT-${PV}"

LICENSE="NVIDIA"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	=dev-util/nvidia-cuda-toolkit-9*
	=dev-libs/nvidia-cuda-cudnn-7*
"

pkg_nofetch() {
    einfo "Please download"
    einfo "  - ${SRC_URI}"
    einfo "from ${HOMEPAGE} and place them in ${DISTDIR}"
}

src_install() {
	dobin bin/giexec
	dolib.so lib/*.so*
	dolib.a lib/*.a
	doheader include/*.h
}
