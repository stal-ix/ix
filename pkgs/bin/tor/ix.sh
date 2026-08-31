{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tor
{% endblock %}

{% block version %}
0.4.9.11
{% endblock %}

{% block fetch %}
https://dist.torproject.org/tor-{{self.version().strip()}}.tar.gz
2e6c1720118c812acf0079fd47cf91b6bfaba5d766c321c4d3d2a28d6a11a8ed
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/cap
lib/zstd
lib/event
lib/seccomp
lib/bsd/overlay
{% endblock %}

{% block configure_flags %}
--enable-lzma
--enable-zstd
--disable-asciidoc
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="${CFLAGS} -UNDEBUG"
{% endblock %}
