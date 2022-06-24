{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.8.2.tar.gz
sha:a5f9bf2ab204b05f34f752321ad96ab950a86a955737d313886614742e9c5fbe
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
