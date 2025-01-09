{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v7.1.3.tar.gz
sha:99bbccd7a192fb11070fa75f4d8adaa1379d0a27dd3cbc1f78e1bace1c2d0e46
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
