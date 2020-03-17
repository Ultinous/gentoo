# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
adler32-1.0.4
ansi_term-0.11.0
ansi_term-0.12.1
arrayref-0.3.6
arrayvec-0.5.1
async-compression-0.3.1
atty-0.2.14
autocfg-1.0.0
backtrace-0.3.45
backtrace-sys-0.1.33
base64-0.11.0
bitflags-1.2.1
blake2b_simd-0.5.10
block-buffer-0.7.3
block-padding-0.1.5
bumpalo-3.2.0
byte-tools-0.3.1
byteorder-1.3.4
bytes-0.5.4
cast-0.2.3
cc-1.0.50
cfg-if-0.1.10
chrono-0.4.11
clap-2.33.0
constant_time_eq-0.1.5
core-foundation-0.7.0
core-foundation-sys-0.7.0
crc32fast-1.2.0
crossbeam-utils-0.7.2
daggy-0.6.0
digest-0.8.1
dirs-2.0.2
dirs-sys-0.3.4
dtoa-0.4.5
encoding_rs-0.8.22
failure-0.1.7
failure_derive-0.1.7
fake-simd-0.1.2
fixedbitset-0.1.9
fixedbitset-0.2.0
flate2-1.0.13
fnv-1.0.6
foreign-types-0.3.2
foreign-types-shared-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.3.4
futures-channel-0.3.4
futures-core-0.3.4
futures-executor-0.3.4
futures-io-0.3.4
futures-macro-0.3.4
futures-sink-0.3.4
futures-task-0.3.4
futures-util-0.3.4
generic-array-0.12.3
getrandom-0.1.14
git2-0.11.0
h2-0.2.2
heck-0.3.1
hermit-abi-0.1.8
http-0.2.0
http-body-0.3.1
httparse-1.3.4
hyper-0.13.3
hyper-tls-0.4.1
idna-0.2.0
indexmap-1.3.2
iovec-0.1.4
itoa-0.4.5
jobserver-0.1.21
js-sys-0.3.36
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.67
libgit2-sys-0.10.0
libssh2-sys-0.2.16
libz-sys-1.0.25
linked-hash-map-0.5.2
log-0.4.8
maplit-1.0.2
matches-0.1.8
memchr-2.3.3
mime-0.3.16
mime_guess-2.0.3
miniz_oxide-0.3.6
mio-0.6.21
miow-0.2.1
native-tls-0.2.4
net2-0.2.33
num-integer-0.1.42
num-traits-0.2.11
once_cell-1.3.1
opaque-debug-0.2.3
openssl-0.10.28
openssl-probe-0.1.2
openssl-sys-0.9.54
percent-encoding-2.1.0
pest-2.1.3
pest_derive-2.1.0
pest_generator-2.1.2
pest_meta-2.1.3
petgraph-0.4.13
petgraph-0.5.0
pin-project-0.4.8
pin-project-internal-0.4.8
pin-project-lite-0.1.4
pin-utils-0.1.0-alpha.4
pkg-config-0.3.17
ppv-lite86-0.2.6
proc-macro-error-0.4.11
proc-macro-error-attr-0.4.11
proc-macro-hack-0.5.11
proc-macro-nested-0.1.3
proc-macro2-1.0.9
quote-1.0.3
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_hc-0.2.0
redox_syscall-0.1.56
redox_users-0.3.4
remove_dir_all-0.5.2
reqwest-0.10.4
rust-argon2-0.7.0
rustc-demangle-0.1.16
rustc_version-0.2.3
ryu-1.0.2
same-file-1.0.6
schannel-0.1.17
security-framework-0.4.1
security-framework-sys-0.4.1
semver-0.9.0
semver-parser-0.7.0
serde-1.0.104
serde-aux-0.6.1
serde-tuple-vec-map-1.0.0
serde_derive-1.0.104
serde_json-1.0.48
serde_urlencoded-0.6.1
serde_yaml-0.8.11
sha-1-0.8.2
slab-0.4.2
smallvec-1.2.0
strsim-0.8.0
structopt-0.3.11
structopt-derive-0.4.4
strum-0.17.1
strum_macros-0.17.1
syn-1.0.16
syn-mid-0.5.0
synstructure-0.12.3
tempfile-3.1.0
textwrap-0.11.0
thiserror-1.0.11
thiserror-impl-1.0.11
time-0.1.42
tokio-0.2.13
tokio-tls-0.3.0
tokio-util-0.2.0
tower-service-0.3.0
try-lock-0.2.2
typenum-1.11.2
ucd-trie-0.1.2
unicase-2.6.0
unicode-bidi-0.3.4
unicode-normalization-0.1.12
unicode-segmentation-1.6.0
unicode-width-0.1.7
unicode-xid-0.2.0
url-2.1.1
vcpkg-0.2.8
vec_map-0.8.1
version_check-0.9.1
walkdir-2.3.1
want-0.3.0
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.59
wasm-bindgen-backend-0.2.59
wasm-bindgen-futures-0.4.9
wasm-bindgen-macro-0.2.59
wasm-bindgen-macro-support-0.2.59
wasm-bindgen-shared-0.2.59
web-sys-0.3.36
winapi-0.2.8
winapi-0.3.8
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.3
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.6.2
ws2_32-sys-0.2.1
yaml-merge-keys-0.4.0
yaml-rust-0.4.3
"

inherit cargo bash-completion-r1

COMPDIR="${WORKDIR}/completions"
TMPBIN="${S}/target/release/${PN}"
SRCTAR="${PN}-release-${PV}.tar.gz"

DESCRIPTION="General purpose Docker image management tool"
HOMEPAGE="https://github.com/Ultinous/docker-util"
SRC_URI="${SRCTAR} $(cargo_crate_uris ${CRATES})"

RESTRICT="mirror"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS=""
IUSE="bash-completion zsh-completion fish-completion"

DEPEND=">=app-emulation/docker-19"
RDEPEND="${DEPEND}
	dev-libs/openssl:0=
	sys-libs/zlib
	fish-completion? ( app-shells/fish )
	zsh-completion? ( app-shells/zsh )
"
BDEPEND=">=virtual/rust-1.41.1"

pkg_nofetch() {
	elog "Please obtain ${SRCTAR} from Ultinous and place it in the distfiles directory"
}

src_prepare() {
	default
	rm -rf ${S}
	mv ${WORKDIR}/${PN}-release-${PV} ${S}
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
