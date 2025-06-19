{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ugrep
{% endblock %}

{% block version %}
7.5.0
{% endblock %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v{{self.version().strip()}}.tar.gz
08ed29981e4e9ed07077139519a17273658d6097f90642a14d9dfdf07fb74ee9
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/lz4
lib/zstd
lib/bzip/2
lib/pcre/2
lib/brotli
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
find m4/ -type f | while read l; do
    sed -e 's|/usr/|/nowhere/|' -e 's|/usr |/nowhere |' -i ${l}
done
{% endblock %}
