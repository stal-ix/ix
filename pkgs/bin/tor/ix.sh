{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.torproject.org/tpo/core/tor/-/archive/tor-0.4.8.16/tor-tor-0.4.8.16.tar.bz2
sha:c8aaf88de08bc03d16dccd94a6fe93b313d7b3c01b31c79a8bdc2b6e20c928be
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
export OPTFLAGS="${OPTFLAGS} -UNDEBUG"
{% endblock %}
