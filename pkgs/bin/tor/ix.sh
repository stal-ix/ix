{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.torproject.org/tpo/core/tor/-/archive/tor-0.4.8.12/tor-tor-0.4.8.12.tar.bz2
sha:9ff12b51062b7a8a8e006d034c5e09690f27a9fd963f7bc38a0565363b6f435a
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
