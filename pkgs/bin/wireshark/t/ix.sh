{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wireshark
{% endblock %}

{% block version %}
4.6.10
{% endblock %}

{% block fetch %}
https://github.com/wireshark/wireshark/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c271e8d2569fe170bddcf7434fbee8fa20781ecade9e9d6173f00c2215c9061b
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/nl
lib/cap
lib/c++
lib/lz4
lib/lzo
lib/sbc
lib/ssh
lib/zstd
lib/pcap
lib/opus
lib/glib
lib/intl
lib/pcre
lib/xml/2
lib/c/ares
lib/snappy
lib/pcre/2
lib/gcrypt
lib/brotli
lib/gnutls
lib/mini/zip
lib/ng/http/2
lib/xiph/speex/dsp
{% endblock %}

{% block cmake_flags %}
USE_STATIC=ON
ENABLE_DEBUG=OFF
ENABLE_STATIC=ON
ENABLE_WERROR=OFF
ENABLE_ASSERT=OFF
ENABLE_PLUGINS=OFF
{% endblock %}

{% block bld_tool %}
bld/perl
bld/flex
bld/bison
bld/python
bld/gettext
bin/doxygen
bin/xsltproc
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|.*find_package.*CARES.*||' -i CMakeLists.txt
{% endblock %}
