{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.9.2.tar.gz
sha:3416267ac5a4dd2938ca91e7bd91db958d65510c9fd33b221f067bd3c6b3fc6a
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
