# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A modified version of runc adding a custom pre-start hook to all containers."
HOMEPAGE="https://github.com/NVIDIA/nvidia-container-runtime"
SRC_URI="(
	https://github.com/NVIDIA/nvidia-container-runtime/archive/v${PV}.tar.gz -> ${P}.tar.gz
)"

RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

DEPEND="
	>=app-emulation/nvidia-container-cli-1.5.0
	sys-libs/libseccomp
"
RDEPEND="${DEPEND}"
BDEPEND="dev-lang/go"

PATCHES=(
	"${FILESDIR}"/fix_video_group_access.patch
)

src_prepare() {
	default

	mkdir -p gopath/src
	ln -rTsf ${S}/toolkit/nvidia-container-toolkit gopath/src/nvidia-container-toolkit
	ln -rTsf ${S}/runtime/src gopath/src/nvidia-container-runtime
}

src_compile() {
	GOPATH=${S}/gopath go install \
			-gcflags "all=-trimpath=${PWD}" \
			-asmflags "all=-trimpath=${PWD}" \
			-ldflags "-extldflags \"${LDFLAGS}\"" \
			"nvidia-container-toolkit" \
			"nvidia-container-runtime"

#	sed -iE 's/^#user = "root:video"$/user = "root:video"/' ${S}/toolkit/config.toml.centos
}

src_install() {
	# For nvidia-container-toolkit
	dobin ${S}/gopath/bin/nvidia-container-toolkit
	ln -s ${S}/gopath/bin/nvidia-container-toolkit ${S}/gopath/bin/nvidia-container-runtime-hook
	dosym nvidia-container-toolkit /usr/bin/nvidia-container-runtime-hook
	insinto /etc/nvidia-container-runtime/
	newins ${S}/toolkit/config.toml.centos config.toml

	# For nvidia-container-runtime
	dobin ${S}/gopath/bin/nvidia-container-runtime
}

pkg_postinst() {
	ewarn "To enable the NVIDIA container runtime you have to manually enable"
	ewarn "it in the relevant configuration files. Please see the official docs"
	ewarn "for details: https://github.com/NVIDIA/nvidia-container-runtime"
}


