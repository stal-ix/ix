{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.7.11.tar.gz
sha:47cf3eee0a6eb759a5ee53b8e0e09d5d1843c5597cfd83e9c88f1b29e6873b2b
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/lz4
lib/zstd
lib/bzip2
lib/pcre/2
{% endblock %}
