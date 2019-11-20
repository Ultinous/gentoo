# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-multilib

DESCRIPTION="Google RPC framework"
HOMEPAGE="https://grpc.io/"
EGIT_REPO_URI="https://github.com/grpc/grpc.git"
EGIT_COMMIT="v${PV}"
EGIT_SUBMODULES=(third_party/benchmark)

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="
	>=dev-libs/protobuf-3.4.0
	net-dns/c-ares
	dev-cpp/gflags
	dev-libs/openssl
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

PATCHES="${FILESDIR}/${PN}-1.9.1_cares_pkgconfig.patch"

multilib_src_configure() {
	local mycmakeargs=(
		-DgRPC_BUILD_TESTS=$(usex test)
		-DgRPC_CARES_PROVIDER=pkgconfig
		-DgRPC_PROTOBUF_PROVIDER=package
		-DgRPC_GFLAGS_PROVIDER=package
		-DgRPC_SSL_PROVIDER=package
		-DgRPC_ZLIB_PROVIDER=package
	)
	cmake-utils_src_configure
}

multilib_src_install() {
	cmake-utils_src_install
	mv ${D}/usr/{lib,$(get_libdir)}
}
