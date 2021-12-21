# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="NVidia container CLI"
HOMEPAGE="https://github.com/NVIDIA/libnvidia-container"

ELFTOOLCHAIN_VER="elftoolchain-0.7.1"
NV_MODPROBE_VER="nvidia-modprobe-396.51"

SRC_URI="(
	https://github.com/NVIDIA/libnvidia-container/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://sourceforge.net/projects/elftoolchain/files/Sources/${ELFTOOLCHAIN_VER}/${ELFTOOLCHAIN_VER}.tar.bz2
	https://github.com/NVIDIA/nvidia-modprobe/archive/396.51.tar.gz -> ${NV_MODPROBE_VER}.tar.gz
)"

RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="-* amd64"
IUSE="systemd"

DEPEND="
	<=x11-drivers/nvidia-drivers-470.57.02
	net-libs/rpcsvc-proto
	net-libs/libtirpc
	systemd? ( sys-apps/systemd )
"
RDEPEND="
	${DEPEND}
	!app-containers/libnvidia-container
"
BDEPEND="
	sys-devel/bmake
	sys-apps/lsb-release
"

PATCHES=(
 "${FILESDIR}"/fix_rpc_flags.patch
 "${FILESDIR}"/fix_git_rev.patch
 "${FILESDIR}"/fix_added_bin_path.patch
)

src_unpack() {
	unpack ${P}.tar.gz
	mv libnvidia-container-${PV} ${S}
	mkdir -p ${S}/deps/src/
	tar xjf ${DISTDIR}/${ELFTOOLCHAIN_VER}.tar.bz2 -C ${S}/deps/src/
	tar xzf ${DISTDIR}/${NV_MODPROBE_VER}.tar.gz -C ${S}/deps/src/
}

src_prepare() {
	default
	use systemd && eapply "${FILESDIR}"/fix_added_bin_path.patch
	touch ${S}/deps/src/${ELFTOOLCHAIN_VER}/.download_stamp
	touch ${S}/deps/src/${NV_MODPROBE_VER}/.download_stamp
}

src_compile() {
	emake \
		shared \
		tools
}

src_install() {
	dobin ${S}/nvidia-container-cli
	dolib.so ${S}/libnvidia-container.so.${PV}
	dosym libnvidia-container.so.${PV} /usr/lib64/libnvidia-container.so.1
}
