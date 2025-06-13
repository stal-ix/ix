{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mg
{% endblock %}

{% block version %}
20221112
{% endblock %}

{% block fetch %}
https://github.com/hboetes/mg/archive/refs/tags/{{self.version().strip()}}.tar.gz
eeb4181fdb6f2bd3f9b5a3c8ccc5b71fbcf9c7f4a805a2f1858334359d44b545
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
    sed -e 's|/usr/bin/pkg|pkg|' \
        -e 's|/usr/bin/install|install|' \
        -i ${l}
done
{% endblock %}

{% block cpp_missing %}
bsd/stdlib.h
{% endblock %}
