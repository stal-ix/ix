{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tor
{% endblock %}

{% block version %}
0.4.9.16
{% endblock %}

{% block fetch %}
https://deb.debian.org/debian/pool/main/t/tor/tor_{{self.version().strip()}}.orig.tar.gz
6180e193152f4525bdca5475168419b2a2035b963c3c60162a187f86e6160e48
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
