# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-multilib

DESCRIPTION="SQLiteC++ (SQLiteCpp) is a smart and easy to use C++ SQLite3 wrapper."
HOMEPAGE="http://srombauts.github.com/SQLiteCpp"
SRC_URI="https://github.com/SRombauts/SQLiteCpp/archive/${PV}.tar.gz -> sqlitecpp-${PV}.tar.gz"
S="${WORKDIR}/SQLiteCpp-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test examples"

DEPEND=">=dev-db/sqlite-3.19"
RDEPEND="${DEPEND}"

multilib_src_configure() {
	local mycmakeargs=(
		-DSQLITECPP_BUILD_EXAMPLES=$(usex examples)
		-DSQLITECPP_BUILD_TESTS=$(usex test)
		-DSQLITE_ENABLE_COLUMN_METADATA=ON
		-DSQLITE_ENABLE_ASSERT_HANDLER=ON
		-DSQLITE_USE_LEGACY_STRUCT=OFF
		-DSQLITECPP_INTERNAL_SQLITE=OFF
		-DSQLITECPP_RUN_CPPLINT=OFF
		-DSQLITECPP_RUN_CPPCHECK=OFF
		-DSQLITECPP_RUN_DOXYGEN=OFF
	)
	cmake-utils_src_configure
}
