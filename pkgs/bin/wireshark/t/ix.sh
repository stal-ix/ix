{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/wireshark/wireshark/archive/refs/tags/v4.1.0.tar.gz
sha:2a12124edfe0884640a7cda475489738fe56d92598bc2890446d7c26bf3c9d8d
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
