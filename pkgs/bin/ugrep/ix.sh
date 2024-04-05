{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v5.1.3.tar.gz
sha:a349abb1a619e33dddbf105528bc5ba5f8d97b4f7b2c69b85d432853df3a9aee
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

{% block cpp_missing %}
sys/types.h
{% endblock %}
