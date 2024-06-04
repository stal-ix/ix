{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v6.1.0.tar.gz
sha:587ebb694dd3d2f5bef9f35df5b9e196b89da981cfe1084539e55b8d9a62fd65
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
