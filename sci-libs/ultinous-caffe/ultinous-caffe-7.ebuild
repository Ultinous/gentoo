# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="Deep learning framework"
HOMEPAGE="https://github.com/Ultinous/caffe"
EGIT_REPO_URI="https://github.com/Ultinous/caffe.git"
EGIT_COMMIT="un-${PV}"
CMAKE_MIN_VERSION="3.1"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="cuda_arch_fermi cuda_arch_kepler cuda_arch_maxwell cuda_arch_pascal cuda_arch_all"
REQUIRED_USE="
	^^ ( cuda_arch_fermi cuda_arch_kepler cuda_arch_maxwell cuda_arch_pascal cuda_arch_all )
"

DEPEND="
	>=dev-libs/boost-1.55
	>=media-libs/opencv-2.4[cuda]
	dev-util/nvidia-cuda-toolkit
	dev-libs/nvidia-cuda-cudnn
	sci-libs/openblas
	dev-libs/protobuf
	dev-cpp/glog
	dev-cpp/gflags
	sci-libs/hdf5
"
RDEPEND="${DEPEND}"

PATCHES="${FILESDIR}/${P}_OpenBLAS.patch"

src_configure() {
	local cuda_arch_name=Auto
	use cuda_arch_fermi && cuda_arch_name=Fermi
	use cuda_arch_kepler && cuda_arch_name=Kepler
	use cuda_arch_maxwell && cuda_arch_name=Maxwell
	use cuda_arch_pascal && cuda_arch_name=Pascal
	use cuda_arch_all && cuda_arch_name=All
	local mycmakeargs=(
		-DCPU_ONLY=OFF
		-DCUDA_ARCH_NAME=${cuda_arch_name}
		-DUSE_CUDNN=ON
		-DUSE_NCCL=OFF
		-DBUILD_python=OFF
		-DBUILD_matlab=OFF
		-DBUILD_docs=OFF
		-DBUILD_python_layer=OFF
		-DUSE_OPENCV=ON
		-DUSE_LEVELDB=OFF
		-DUSE_LMDB=OFF
		-DALLOW_LMDB_NOLOCK=OFF
		-DUSE_OPENMP=OFF
		-DBLAS=Open
	)
	addwrite /dev/nvidia-uvm
	addwrite /dev/nvidiactl
	cmake-utils_src_configure
}
