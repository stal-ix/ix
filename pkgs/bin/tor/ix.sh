{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.torproject.org/tpo/core/tor/-/archive/tor-0.4.7.15/tor-tor-0.4.7.15.tar.bz2
sha:0d28dc3c445a11bfb834446fa9fe91e0f619133bfa1df54d3bf9b741570d7436
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
