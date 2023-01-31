{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.9.7.tar.gz
sha:7f44e2198e2dc3ad1ed88759ece848364c4ba632aca60aefe9c53d5b0c584628
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
