{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
rpm
{% endblock %}

{% block version %}
6.1.0
{% endblock %}

{% block fetch %}
https://ftp.osuosl.org/pub/rpm/releases/rpm-{{self.version().strip() | field(0)}}.{{self.version().strip() | field(1)}}.x/rpm-{{self.version().strip()}}.tar.bz2
f520810d27c74bf1c5d8b8885845c61e0c845f62d33e68b02e020633a8b62fe3
https://github.com/rpm-software-management/rpmpgp_legacy/archive/30699f403450a8f076da450abb8301960d0cb441.tar.gz
db6bbb7d8a5ee049b041c160e59326f4bf271aef31f0be4a91ae5ff844876476
{% endblock %}

{% block unpack %}
mkdir src
cd src
extract 1 ${src}/rpm-*
# rpm 6 keeps its non-Sequoia OpenPGP parser out of tree; 1.1 predates rpm 6
mkdir rpmio/rpmpgp_legacy
(cd rpmio/rpmpgp_legacy; extract 1 ${src}/*.tar.gz)
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/xz
lib/acl
lib/cap
lib/lua
lib/omp
lib/popt
lib/zstd
lib/dbus
lib/intl
lib/magic
lib/gnutls
lib/gcrypt
lib/bzip/2
lib/archive
lib/elfutils
lib/readline
lib/sqlite/3
{% endblock %}

{% block cmake_flags %}
WITH_AUDIT=OFF
WITH_SELINUX=OFF
ENABLE_PYTHON=OFF
ENABLE_PLUGINS=OFF
ENABLE_TESTSUITE=OFF
WITH_SEQUOIA=OFF
WITH_LEGACY_OPENPGP=ON
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/gettext
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
sed -e 's|cmd rpmverify rpmquery|cmd|' \
    -e 's|.*add_tarball.*dist.*||' \
    -i CMakeLists.txt
{% endblock %}

{% block cpp_defines %}
GLOB_BRACE=0
GLOB_ONLYDIR=0
{% endblock %}

{% block c_rename_symbol %}
compress
{% endblock %}
