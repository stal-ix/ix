{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.8.0.tar.gz
sha:96a0db221a2bee280bdaa46cfbabe1e195f37516815e6ff48e1f5f8e3b207df9
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
