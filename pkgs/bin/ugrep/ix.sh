{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.11.2.tar.gz
sha:a314cc6fe149eef9bc0f0d69c6b331d9d4491a100677c1b3fbb2159806cca2dd
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
