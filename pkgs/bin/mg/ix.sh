{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/hboetes/mg/archive/refs/tags/20220212.tar.gz
sha:dd94e6c43bf08f35a7342c416c386529c58d756654720f1797c5708ebcd5eb73
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
