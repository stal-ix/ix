{% extends '//die/cmake.sh' %}

{% block fetch %}
https://gitlab.com/wireshark/wireshark/-/archive/efe8dc051cbd933c3dcdd33d2664e94ab4e703c0/wireshark-efe8dc051cbd933c3dcdd33d2664e94ab4e703c0.tar.bz2
sha:1b31182a76046dc6750f29969357d7ad985ceb3dd8d31fc1549bce21d1ec790f
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
lib/xml2
lib/opus
lib/glib
lib/intl
lib/snappy
lib/pcre/2
lib/gcrypt
lib/brotli
lib/gnutls
lib/mini/zip
lib/ng/http/2
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/compat
lib/xiph/speex/dsp
{% endblock %}

{% block cmake_flags %}
USE_qt6=ON
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
bld/qt/6
bld/bison
bld/python
bld/gettext
bin/doxygen
bin/xsltproc
bld/qt/6/tools
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('wireshark')}}
{% endblock %}
