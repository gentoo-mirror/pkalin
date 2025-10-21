# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson xdg-utils

DESCRIPTION="A Qt and C++ GUI for radare2 reverse engineering framework"
HOMEPAGE="https://github.com/radareorg/iaito"
SRC_URI="
	https://github.com/radareorg/iaito/archive/refs/tags/${PV/_/-}.tar.gz -> ${P}.tar.gz
"
S="${WORKDIR}/${PN}-${PV/_/-}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	=dev-util/radare2-5.9*
"
RDEPEND="${DEPEND}"
EMESON_SOURCE="${S}/src"

src_configure() {
	meson_src_configure
}

src_install() {
	meson_src_install

	# Build system doesn't install anything
	pushd "${S}-build" || die
	dobin iaito
	popd || die
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
