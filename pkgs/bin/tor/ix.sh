{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.torproject.org/tpo/core/tor/-/archive/tor-0.4.7.14/tor-tor-0.4.7.14.tar.bz2
sha:158db1d2b2d672b34d29a03f5b0761347bd5cf773155935df8c9896d622c0546
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

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -UNDEBUG"
{% endblock %}
