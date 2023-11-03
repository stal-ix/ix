{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v4.3.2.tar.gz
sha:32035bb35c98e1f249e1273d135630eb98aa6992e8fe56297a957dd1eb9053a7
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/lz4
lib/zstd
lib/bzip/2
lib/pcre/2
{% endblock %}

{% block patch %}
find m4/ -type f | while read l; do
    sed -e 's|/usr/|/nowhere/|' -e 's|/usr |/nowhere |' -i ${l}
done
{% endblock %}
