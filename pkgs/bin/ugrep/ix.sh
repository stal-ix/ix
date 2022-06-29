{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.8.3.tar.gz
sha:deb7e143ee07019fdaa98a4529596d965185542a195855c1bfb6779fb8dd5e55
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
