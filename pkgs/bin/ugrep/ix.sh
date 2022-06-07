{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.8.1.tar.gz
sha:0d1485554a4ea2bd887c7df365f9138adf185812bd65cce1293fc6959d71767b
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
