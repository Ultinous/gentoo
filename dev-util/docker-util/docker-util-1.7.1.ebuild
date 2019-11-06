# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
adler32-1.0.4
aho-corasick-0.7.6
ansi_term-0.11.0
ansi_term-0.12.1
arrayref-0.3.5
arrayvec-0.4.12
atty-0.2.13
autocfg-0.1.7
backtrace-0.3.40
backtrace-sys-0.1.32
base64-0.10.1
base64-0.11.0
bitflags-1.2.1
blake2b_simd-0.5.8
block-buffer-0.7.3
block-padding-0.1.4
byte-tools-0.3.1
byteorder-1.3.2
bytes-0.4.12
c2-chacha-0.2.3
cast-0.2.2
cc-1.0.47
cfg-if-0.1.10
chrono-0.4.9
clap-2.33.0
cloudabi-0.0.3
constant_time_eq-0.1.4
cookie-0.12.0
cookie_store-0.7.0
core-foundation-0.6.4
core-foundation-sys-0.6.2
crc32fast-1.2.0
crossbeam-deque-0.7.1
crossbeam-epoch-0.7.2
crossbeam-queue-0.1.2
crossbeam-utils-0.6.6
daggy-0.6.0
digest-0.8.1
dirs-2.0.2
dirs-sys-0.3.4
dtoa-0.4.4
either-1.5.3
encoding_rs-0.8.20
error-chain-0.12.1
failure-0.1.6
failure_derive-0.1.6
fake-simd-0.1.2
fixedbitset-0.1.9
flate2-1.0.12
fnv-1.0.6
foreign-types-0.3.2
foreign-types-shared-0.1.1
fuchsia-cprng-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.1.29
futures-cpupool-0.1.8
generic-array-0.12.3
getrandom-0.1.13
git2-0.10.1
h2-0.1.26
heck-0.3.1
hermit-abi-0.1.3
http-0.1.19
http-body-0.1.0
httparse-1.3.4
hyper-0.12.35
hyper-tls-0.3.2
idna-0.1.5
idna-0.2.0
indexmap-1.3.0
iovec-0.1.4
itoa-0.4.4
jobserver-0.1.17
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.65
libgit2-sys-0.9.1
libssh2-sys-0.2.13
libz-sys-1.0.25
linked-hash-map-0.5.2
lock_api-0.3.1
log-0.4.8
maplit-1.0.2
matches-0.1.8
maybe-uninit-2.0.0
memchr-2.2.1
memoffset-0.5.2
mime-0.3.14
mime_guess-2.0.1
miniz_oxide-0.3.5
mio-0.6.19
miow-0.2.1
native-tls-0.2.3
net2-0.2.33
nodrop-0.1.14
num-integer-0.1.41
num-traits-0.2.8
num_cpus-1.11.0
once_cell-1.2.0
opaque-debug-0.2.3
openssl-0.10.25
openssl-probe-0.1.2
openssl-sys-0.9.52
ordermap-0.3.5
parking_lot-0.9.0
parking_lot_core-0.6.2
percent-encoding-1.0.1
percent-encoding-2.1.0
pest-2.1.2
pest_derive-2.1.0
pest_generator-2.1.1
pest_meta-2.1.2
petgraph-0.4.13
pkg-config-0.3.17
ppv-lite86-0.2.6
proc-macro-error-0.2.6
proc-macro2-1.0.6
publicsuffix-1.5.3
quote-1.0.2
rand-0.6.5
rand-0.7.2
rand_chacha-0.1.1
rand_chacha-0.2.1
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.5.1
rand_hc-0.1.0
rand_hc-0.2.0
rand_isaac-0.1.1
rand_jitter-0.1.4
rand_os-0.1.3
rand_pcg-0.1.2
rand_xorshift-0.1.1
rdrand-0.4.0
redox_syscall-0.1.56
redox_users-0.3.1
regex-1.3.1
regex-syntax-0.6.12
remove_dir_all-0.5.2
reqwest-0.9.22
rust-argon2-0.5.1
rustc-demangle-0.1.16
rustc_version-0.2.3
ryu-1.0.2
same-file-1.0.5
schannel-0.1.16
scopeguard-1.0.0
security-framework-0.3.2
security-framework-sys-0.3.2
semver-0.9.0
semver-parser-0.7.0
serde-1.0.102
serde-aux-0.6.1
serde-tuple-vec-map-0.2.1
serde_derive-1.0.102
serde_json-1.0.41
serde_urlencoded-0.5.5
serde_yaml-0.8.11
sha-1-0.8.1
slab-0.4.2
smallvec-0.6.13
string-0.2.1
strsim-0.8.0
structopt-0.3.3
structopt-derive-0.3.3
syn-1.0.7
synstructure-0.12.2
tempfile-3.1.0
textwrap-0.11.0
thiserror-1.0.4
thiserror-impl-1.0.4
thread_local-0.3.6
time-0.1.42
tokio-0.1.22
tokio-buf-0.1.1
tokio-current-thread-0.1.6
tokio-executor-0.1.8
tokio-io-0.1.12
tokio-reactor-0.1.10
tokio-sync-0.1.7
tokio-tcp-0.1.3
tokio-threadpool-0.1.16
tokio-timer-0.2.11
try-lock-0.2.2
try_from-0.3.2
typenum-1.11.2
ucd-trie-0.1.2
unicase-2.5.1
unicode-bidi-0.3.4
unicode-normalization-0.1.8
unicode-segmentation-1.5.0
unicode-width-0.1.6
unicode-xid-0.2.0
url-1.7.2
url-2.1.0
uuid-0.7.4
vcpkg-0.2.7
vec_map-0.8.1
version_check-0.1.5
walkdir-2.2.9
want-0.2.0
wasi-0.7.0
winapi-0.2.8
winapi-0.3.8
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.2
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.6.2
ws2_32-sys-0.2.1
yaml-merge-keys-0.4.0
yaml-rust-0.4.3
"

inherit cargo bash-completion-r1

COMPDIR="${WORKDIR}/completions"
TMPBIN="${S}/target/release/docker-util"
SRCTAR="${PN}-release-${PV}.tar.gz"

DESCRIPTION="General purpose Docker image management tool"
HOMEPAGE="https://github.com/Ultinous/docker-util"
SRC_URI="${SRCTAR}
	$(cargo_crate_uris ${CRATES})"

#RESTRICT="fetch"
RESTRICT="mirror"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64"
IUSE="bash-completion zsh-completion fish-completion"

DEPEND=">=app-emulation/docker-19"
RDEPEND="${DEPEND}
	dev-libs/openssl:0=
	sys-libs/zlib
	fish-completion? ( app-shells/fish )
	zsh-completion? ( app-shells/zsh )
"
BDEPEND=">=virtual/rust-1.37"

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
	cargo_src_install --path=.

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

