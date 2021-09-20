# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_SETUPTOOLS=pyproject.toml
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Check Portage's VDB for internal inconsistency on ELF metadata"
HOMEPAGE="https://github.com/thesamesam/recover-broken-vdb"
if [[ ${PV} == *9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/thesamesam/${PN}.git"
else
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"

# Require latest version of pax-utils to avoid users breaking their systems again
# The tool itself works fine with older versions
RDEPEND=">=app-misc/pax-utils-1.3.3
	$(python_gen_cond_dep 'sys-apps/portage[${PYTHON_USEDEP}]')"
