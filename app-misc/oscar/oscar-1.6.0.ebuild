# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 qmake-utils

DESCRIPTION="Software used to analyze data from CPAP machines"
HOMEPAGE="https://www.sleepfiles.com/OSCAR/"
EGIT_REPO_URI="https://gitlab.com/CrimsonNape/OSCAR-code.git"
EGIT_TAG="v${PV}"

LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~amd64"

IUSE="debug"

DEPEND="virtual/opengl
	x11-libs/libX11
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtopengl:5
	dev-qt/qtserialport:5
	virtual/glu
	virtual/libudev
	sys-libs/zlib"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	cd "${S}"
	eqmake5 OSCAR_QT.pro
}

src_install() {
	cd "${S}/oscar"
	dobin OSCAR || die
	dodoc ../README || die
	dodoc docs/* || die
}
