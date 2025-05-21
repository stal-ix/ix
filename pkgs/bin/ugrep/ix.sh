{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ugrep
{% endblock %}

{% block version %}
7.4.3
{% endblock %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:105b495f4d2773802b5a71e2375ba07bca4e67fd6837e5fc1d00be5cf4938f16
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
