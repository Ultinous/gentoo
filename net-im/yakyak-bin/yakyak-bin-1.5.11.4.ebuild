# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker xdg

MY_PN="${PN/-bin}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Desktop chat client for Google Hangouts"
HOMEPAGE="https://github.com/yakyak/yakyak"
SRC_URI="https://github.com/yakyak/${MY_PN}/releases/download/v${PV}/${MY_P}-linux-amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror strip"

RDEPEND="
media-video/ffmpeg
x11-libs/gtk+
"

QA_PRESTRIPPED="
	/opt/yakyak/libnode.so
	/opt/yakyak/libffmpeg.so
	/opt/yakyak/yakyak
"

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_prepare() {
	rm -rf usr/share/doc
	default
}

src_install() {
	mkdir -p "${ED}"
	cp -r ./opt "${ED}"/
	cp -r ./usr "${ED}"/
	default
}
