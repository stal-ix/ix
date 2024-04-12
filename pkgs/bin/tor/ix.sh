{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.torproject.org/tpo/core/tor/-/archive/tor-0.4.8.11/tor-tor-0.4.8.11.tar.bz2
sha:4b09cd7cba054ee89cb57af349f10c55a7e3d8a968bb5670641ae9bcead652b9
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
