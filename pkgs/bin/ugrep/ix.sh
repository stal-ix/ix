{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.9.6.tar.gz
sha:4ff066c4d6afb46df598f184069eb2d96134642dca1e97f1161eebaa1d97a455
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
