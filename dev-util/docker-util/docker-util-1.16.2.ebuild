# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
addr2line-0.15.2
adler-1.0.2
aho-corasick-0.7.18
ansi_term-0.11.0
ansi_term-0.12.1
async-compression-0.3.8
atty-0.2.14
autocfg-1.0.1
backtrace-0.3.60
base64-0.13.0
bitflags-1.2.1
block-buffer-0.7.3
block-buffer-0.9.0
block-padding-0.1.5
bumpalo-3.7.0
byte-tools-0.3.1
byteorder-1.4.3
bytes-1.0.1
cast-0.2.6
cc-1.0.68
cfg-if-1.0.0
clap-2.33.3
core-foundation-0.9.1
core-foundation-sys-0.8.2
cpufeatures-0.1.5
crc32fast-1.2.1
daggy-0.7.0
digest-0.8.1
digest-0.9.0
dirs-3.0.2
dirs-sys-0.3.6
dtoa-0.4.8
encoding_rs-0.8.28
failure-0.1.8
failure_derive-0.1.8
fake-simd-0.1.2
fixedbitset-0.2.0
flate2-1.0.20
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.0.1
futures-0.3.15
futures-channel-0.3.15
futures-core-0.3.15
futures-executor-0.3.15
futures-io-0.3.15
futures-macro-0.3.15
futures-sink-0.3.15
futures-task-0.3.15
futures-util-0.3.15
generic-array-0.12.4
generic-array-0.14.4
getrandom-0.2.3
gimli-0.24.0
git2-0.13.20
h2-0.3.3
hashbrown-0.9.1
heck-0.3.3
hermit-abi-0.1.18
http-0.2.4
http-body-0.4.2
httparse-1.4.1
httpdate-1.0.1
hyper-0.14.9
hyper-tls-0.5.0
idna-0.2.3
indexmap-1.6.2
ipnet-2.3.1
itoa-0.4.7
jobserver-0.1.22
js-sys-0.3.51
lazy_static-1.4.0
libc-0.2.97
libgit2-sys-0.12.21+1.1.0
libz-sys-1.1.3
linked-hash-map-0.5.4
log-0.4.14
maplit-1.0.2
matches-0.1.8
memchr-2.4.0
mime-0.3.16
miniz_oxide-0.4.4
mio-0.7.13
miow-0.3.7
native-tls-0.2.7
ntapi-0.3.6
object-0.25.3
once_cell-1.8.0
opaque-debug-0.2.3
opaque-debug-0.3.0
openssl-0.10.35
openssl-probe-0.1.4
openssl-sys-0.9.65
percent-encoding-2.1.0
pest-2.1.3
pest_derive-2.1.0
pest_generator-2.1.3
pest_meta-2.1.3
petgraph-0.5.1
pin-project-lite-0.2.6
pin-utils-0.1.0
pkg-config-0.3.19
ppv-lite86-0.2.10
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro-hack-0.5.19
proc-macro-nested-0.1.7
proc-macro2-1.0.27
quote-1.0.9
rand-0.8.4
rand_chacha-0.3.1
rand_core-0.6.3
rand_hc-0.3.1
redox_syscall-0.2.9
redox_users-0.4.0
regex-1.5.4
regex-syntax-0.6.25
remove_dir_all-0.5.3
reqwest-0.11.4
rustc-demangle-0.1.20
rustc_version-0.3.3
ryu-1.0.5
same-file-1.0.6
schannel-0.1.19
security-framework-2.3.1
security-framework-sys-2.3.0
semver-0.11.0
semver-1.0.3
semver-parser-0.10.2
serde-1.0.126
serde-tuple-vec-map-1.0.0
serde_derive-1.0.126
serde_json-1.0.64
serde_urlencoded-0.7.0
serde_yaml-0.8.17
sha-1-0.8.2
sha-1-0.9.6
signal-hook-registry-1.4.0
slab-0.4.3
socket2-0.4.0
strsim-0.8.0
structopt-0.3.21
structopt-derive-0.4.14
strum-0.21.0
strum_macros-0.21.1
syn-1.0.73
synstructure-0.12.4
tempfile-3.2.0
term_size-0.3.2
textwrap-0.11.0
thiserror-1.0.25
thiserror-impl-1.0.25
tinyvec-1.2.0
tinyvec_macros-0.1.0
tokio-1.7.1
tokio-native-tls-0.3.0
tokio-util-0.6.7
tower-service-0.3.1
tracing-0.1.26
tracing-core-0.1.18
try-lock-0.2.3
typenum-1.13.0
ucd-trie-0.1.3
unicode-bidi-0.3.5
unicode-normalization-0.1.19
unicode-segmentation-1.7.1
unicode-width-0.1.8
unicode-xid-0.2.2
url-2.2.2
vcpkg-0.2.15
vec_map-0.8.2
version_check-0.9.3
walkdir-2.3.2
want-0.3.0
wasi-0.10.2+wasi-snapshot-preview1
wasm-bindgen-0.2.74
wasm-bindgen-backend-0.2.74
wasm-bindgen-futures-0.4.24
wasm-bindgen-macro-0.2.74
wasm-bindgen-macro-support-0.2.74
wasm-bindgen-shared-0.2.74
web-sys-0.3.51
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.7.0
yaml-merge-keys-0.4.1
yaml-rust-0.4.5
"

inherit cargo bash-completion-r1

MY_PV="${PV/_/-}"

COMPDIR="${WORKDIR}/completions"
TMPBIN="${S}/target/release/${PN}"
SRCTAR="${PN}-release-${MY_PV}.tar.gz"

DESCRIPTION="General purpose Docker image management tool"
HOMEPAGE="https://github.com/Ultinous/docker-util"
SRC_URI="http://can-i-haz-files/gentoo/${SRCTAR} $(cargo_crate_uris ${CRATES})"

RESTRICT="mirror"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64 ~x86 ~arm arm64"
IUSE="bash-completion zsh-completion fish-completion"

DEPEND="
	dev-libs/openssl:=
	dev-libs/libgit2:=
"
RDEPEND="${DEPEND}
	>=app-emulation/docker-19
"
BDEPEND=">=virtual/rust-1.52.0"

pkg_nofetch() {
	einfo "Please download ${SRCTAR} from ${HOMEPAGE} and place them in your DISTDIR directory."
}

src_prepare() {
	default
	rm -rf ${S}
	mv ${WORKDIR}/${PN}-release-${MY_PV} ${S}
	mkdir ${COMPDIR}
}

src_compile() {
	cargo_src_compile

	use bash-completion &&
		${TMPBIN} completions bash > ${COMPDIR}/bash

	use fish-completion &&
		${TMPBIN} completions fish > ${COMPDIR}/fish

	use zsh-completion &&
		${TMPBIN} completions zsh > ${COMPDIR}/zsh
}

src_install() {
	cargo_src_install

	use bash-completion &&
		newbashcomp ${COMPDIR}/bash ${PN}

	if use fish-completion; then
		insinto /usr/share/fish/completions
		newins ${COMPDIR}/fish ${PN}
	fi

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins ${COMPDIR}/zsh _${PN}
	fi
}