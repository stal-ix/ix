{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.torproject.org/tpo/core/tor/-/archive/tor-0.4.8.13/tor-tor-0.4.8.13.tar.bz2
sha:e79df6984a933bb5a83167f6c9fbaa9f23f33726d717ba5a4c411a3f09b0623f
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
