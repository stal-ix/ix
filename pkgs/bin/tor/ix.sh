{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tor
{% endblock %}

{% block version %}
0.4.8.17
{% endblock %}

{% block fetch %}
https://dist.torproject.org/tor-{{self.version().strip()}}.tar.gz
79b4725e1d4b887b9e68fd09b0d2243777d5ce3cd471e538583bcf6f9d8cdb56
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
