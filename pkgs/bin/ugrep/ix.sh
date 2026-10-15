{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ugrep
{% endblock %}

{% block version %}
7.8.5
{% endblock %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f080ab6cd9d96a5357570cb60a99e09ebe5eef11cf322c35373dbe815378a1f2
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
