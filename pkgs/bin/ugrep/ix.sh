{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v5.1.1.tar.gz
sha:687fc43a02287bac18f973822036bb3c470a81825b8eb3d98a335603b249b13b
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
