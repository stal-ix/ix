{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://ftp.osuosl.org/pub/rpm/releases/rpm-4.19.x/rpm-4.19.0.tar.bz2
sha:b30916dc148cbeab077797e9fc365702931e3a9a7eacf70add84153b549b3f77
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/acl
lib/cap
lib/lua
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
ENABLE_OPENMP=OFF
ENABLE_PLUGINS=OFF
ENABLE_TESTSUITE=OFF
WITH_INTERNAL_OPENPGP=ON
{% endblock %}

{% block bld_tool %}
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
