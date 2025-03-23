{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.torproject.org/tpo/core/tor/-/archive/tor-0.4.8.15/tor-tor-0.4.8.15.tar.bz2
sha:02098581fc56a5e54beeab1976aea73445f7a2836eb4a9f7d495476f245b3324
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
