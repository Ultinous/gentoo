# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
addr2line-0.14.1
adler-0.2.3
aho-corasick-0.7.15
ansi_term-0.11.0
ansi_term-0.12.1
arrayref-0.3.6
arrayvec-0.5.2
async-compression-0.3.7
atty-0.2.14
autocfg-1.0.1
backtrace-0.3.55
base64-0.13.0
bitflags-1.2.1
blake2b_simd-0.5.11
block-buffer-0.7.3
block-buffer-0.9.0
block-padding-0.1.5
bumpalo-3.4.0
byte-tools-0.3.1
byteorder-1.3.4
bytes-0.5.6
bytes-1.0.0
cast-0.2.3
cc-1.0.66
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.19
clap-2.33.3
constant_time_eq-0.1.5
core-foundation-0.9.1
core-foundation-sys-0.8.2
cpuid-bool-0.1.2
crc32fast-1.2.1
crossbeam-utils-0.8.1
daggy-0.7.0
darling-0.10.2
darling_core-0.10.2
darling_macro-0.10.2
digest-0.8.1
digest-0.9.0
dirs-3.0.1
dirs-sys-0.3.5
dtoa-0.4.7
encoding_rs-0.8.26
failure-0.1.8
failure_derive-0.1.8
fake-simd-0.1.2
fixedbitset-0.2.0
flate2-1.0.19
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.0.0
futures-0.3.9
futures-channel-0.3.9
futures-core-0.3.9
futures-executor-0.3.9
futures-io-0.3.9
futures-macro-0.3.9
futures-sink-0.3.9
futures-task-0.3.9
futures-util-0.3.9
generic-array-0.12.3
generic-array-0.14.4
getrandom-0.1.16
gimli-0.23.0
git2-0.13.15
h2-0.3.0
hashbrown-0.9.1
heck-0.3.2
hermit-abi-0.1.17
http-0.2.2
http-body-0.4.0
httparse-1.3.4
httpdate-0.3.2
hyper-0.14.2
hyper-tls-0.5.0
ident_case-1.0.1
idna-0.2.0
indexmap-1.6.1
ipnet-2.3.0
itoa-0.4.7
jobserver-0.1.21
js-sys-0.3.46
lazy_static-1.4.0
libc-0.2.82
libgit2-sys-0.12.17+1.1.0
libz-sys-1.1.2
linked-hash-map-0.5.3
log-0.4.11
maplit-1.0.2
matches-0.1.8
memchr-2.3.4
mime-0.3.16
miniz_oxide-0.4.3
mio-0.7.7
miow-0.3.6
native-tls-0.2.7
ntapi-0.3.6
num-integer-0.1.44
num-traits-0.2.14
object-0.22.0
once_cell-1.5.2
opaque-debug-0.2.3
opaque-debug-0.3.0
openssl-0.10.32
openssl-probe-0.1.2
openssl-sys-0.9.60
percent-encoding-2.1.0
pest-2.1.3
pest_derive-2.1.0
pest_generator-2.1.3
pest_meta-2.1.3
petgraph-0.5.1
pin-project-0.4.27
pin-project-1.0.3
pin-project-internal-0.4.27
pin-project-internal-1.0.3
pin-project-lite-0.2.1
pin-utils-0.1.0
pkg-config-0.3.19
ppv-lite86-0.2.10
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro-hack-0.5.19
proc-macro-nested-0.1.6
proc-macro2-1.0.24
quote-1.0.8
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_hc-0.2.0
redox_syscall-0.1.57
redox_users-0.3.5
regex-1.4.2
regex-syntax-0.6.21
remove_dir_all-0.5.3
reqwest-0.11.0
rust-argon2-0.8.3
rustc-demangle-0.1.18
rustc_version-0.2.3
ryu-1.0.5
same-file-1.0.6
schannel-0.1.19
security-framework-2.0.0
security-framework-sys-2.0.0
semver-0.11.0
semver-0.9.0
semver-parser-0.10.2
semver-parser-0.7.0
serde-1.0.118
serde-aux-2.1.0
serde-tuple-vec-map-1.0.0
serde_derive-1.0.118
serde_json-1.0.61
serde_urlencoded-0.7.0
serde_with-1.6.0
serde_with_macros-1.3.0
serde_yaml-0.8.15
sha-1-0.8.2
sha-1-0.9.2
signal-hook-registry-1.3.0
slab-0.4.2
socket2-0.3.19
strsim-0.8.0
strsim-0.9.3
structopt-0.3.21
structopt-derive-0.4.14
strum-0.20.0
strum_macros-0.20.1
syn-1.0.58
synstructure-0.12.4
tempfile-3.1.0
term_size-0.3.2
textwrap-0.11.0
thiserror-1.0.23
thiserror-impl-1.0.23
thread_local-1.1.0
time-0.1.44
tinyvec-1.1.0
tinyvec_macros-0.1.0
tokio-1.0.1
tokio-native-tls-0.3.0
tokio-stream-0.1.1
tokio-util-0.6.0
tower-service-0.3.0
tracing-0.1.22
tracing-core-0.1.17
tracing-futures-0.2.4
try-lock-0.2.3
typenum-1.12.0
ucd-trie-0.1.3
unicode-bidi-0.3.4
unicode-normalization-0.1.16
unicode-segmentation-1.7.1
unicode-width-0.1.8
unicode-xid-0.2.1
url-2.2.0
vcpkg-0.2.11
vec_map-0.8.2
version_check-0.9.2
walkdir-2.3.1
want-0.3.0
wasi-0.10.0+wasi-snapshot-preview1
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.69
wasm-bindgen-backend-0.2.69
wasm-bindgen-futures-0.4.19
wasm-bindgen-macro-0.2.69
wasm-bindgen-macro-support-0.2.69
wasm-bindgen-shared-0.2.69
web-sys-0.3.46
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.7.0
yaml-merge-keys-0.4.1
yaml-rust-0.4.5
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
KEYWORDS="amd64 ~x86 ~arm ~arm64"
IUSE="bash-completion zsh-completion fish-completion"

DEPEND="
	dev-libs/openssl:=
	dev-libs/libgit2:=
"
RDEPEND="${DEPEND}
	>=app-emulation/docker-19
"
BDEPEND=">=virtual/rust-1.46.0"

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
