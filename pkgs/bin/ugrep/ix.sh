{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.12.5.tar.gz
sha:5ff60ea5b5f2fe2068bbc0b0d9072fe55eb310e094588bdb2324d9123aa92114
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
