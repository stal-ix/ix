{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tor
{% endblock %}

{% block version %}
0.4.8.16
{% endblock %}

{% block fetch %}
https://dist.torproject.org/tor-{{self.version().strip()}}.tar.gz
sha:6540dd377a120fb8e7d27530aa3b7ff72a0fa5b4f670fe1d64c987c1cfd390cb
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
