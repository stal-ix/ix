{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v4.0.4.tar.gz
sha:3985b5381c2ba02c24d71fa7754d045fe72bc31fc66c02a8375140b2f8a5e7e6
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
