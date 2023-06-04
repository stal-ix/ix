{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.12.0.tar.gz
sha:f69330b74a2d2e46c878c19da3453e97d92ae960d0e1a92a853481cb889fca3e
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

{% block bld_tool %}
bld/bash
{% endblock %}

{% block patch %}
sed -e 's|/bin/bash|/usr/bin/env bash|' -i add-filters.sh
{% endblock %}
