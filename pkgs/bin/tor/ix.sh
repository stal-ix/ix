{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.torproject.org/tpo/core/tor/-/archive/tor-0.4.5.16/tor-tor-0.4.5.16.tar.bz2
sha:87b4b3c9a3f16419e2978e95da7878e06483aeea07a1a0f6b57f9eb234c1ab1a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/cap
lib/zstd
lib/event
lib/seccomp
{% endblock %}

{% block cpp_missing %}
bsd/readpassphrase.h
{% endblock %}

{% block configure_flags %}
--enable-lzma
--enable-zstd
--disable-asciidoc
{% endblock %}

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -UNDEBUG"
{% endblock %}
