{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tor
{% endblock %}

{% block version %}
0.4.9.15
{% endblock %}

{% block fetch %}
https://deb.debian.org/debian/pool/main/t/tor/tor_{{self.version().strip()}}.orig.tar.gz
1911f5b216a6814ed143a08bbcff1c6dc96d2ca3b505df9a21876080a92963f3
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
