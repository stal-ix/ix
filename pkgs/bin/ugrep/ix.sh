{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ugrep
{% endblock %}

{% block version %}
7.4.1
{% endblock %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:4e263e226dfb768ad82cab95f6fcfee9af41e53004b12023d3c42ce36760a5d8
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
