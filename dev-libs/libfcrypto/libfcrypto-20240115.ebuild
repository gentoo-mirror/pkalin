# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Library for encryption formats"
HOMEPAGE="https://github.com/libyal/libfcrypto"
SRC_URI="https://github.com/libyal/libfcrypto/releases/download/${PV}/${PN}-alpha-${PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="nls +python"

DEPEND="
	nls? (
		virtual/libiconv
		virtual/libintl
	)
	dev-libs/libcerror[nls=]
"
RDEPEND="
	${DEPEND}
"

src_prepare() {
	eautoreconf
	eapply_user
}

src_configure() {
	econf \
		$(use_enable nls) \
		$(use_with nls libiconv-prefix) \
		$(use_with nls libintl-prefix) \
		$(use_enable python)
}

src_install() {
	default
	# see https://projects.gentoo.org/qa/policy-guide/installed-files.html#pg0303
	find "${ED}" -name '*.la' -delete || die
}
