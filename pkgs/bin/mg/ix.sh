{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/hboetes/mg/archive/refs/tags/20221112.tar.gz
sha:eeb4181fdb6f2bd3f9b5a3c8ccc5b71fbcf9c7f4a805a2f1858334359d44b545
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|/usr/bin/pkg|pkg|' -i ${l}
done
{% endblock %}

{% block cpp_missing %}
bsd/stdlib.h
{% endblock %}
