# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="C++ microframework for web (inspired by Python Flask)"
HOMEPAGE="https://github.com/Ultinous/crow"
EGIT_REPO_URI="https://github.com/Ultinous/crow.git"
EGIT_COMMIT="un_v${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="
	>=dev-libs/boost-1.52
	dev-libs/openssl
"
RDEPEND="${DEPEND}"

src_compile() {
	if use test; then
		cmake-utils_src_compile
	else
		cmake-utils_src_compile amalgamation
	fi
}

src_install() {
	doheader amalgamate/crow_all.h
}
