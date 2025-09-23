{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tor
{% endblock %}

{% block version %}
0.4.8.18
{% endblock %}

{% block fetch %}
https://dist.torproject.org/tor-{{self.version().strip()}}.tar.gz
4aea6c109d4eff4ea2bafb905a7e6b0a965d14fe856214b02fcd9046b4d93af8
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
