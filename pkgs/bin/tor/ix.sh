{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tor
{% endblock %}

{% block version %}
0.4.9.13
{% endblock %}

{% block fetch %}
https://deb.debian.org/debian/pool/main/t/tor/tor_{{self.version().strip()}}.orig.tar.gz
5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792
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
