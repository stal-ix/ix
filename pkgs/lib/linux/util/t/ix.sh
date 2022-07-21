{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v2.38.tar.gz
sha:f3cf9d165f50f46e5c0a1076d178a75a5ae30463345e9c19335552b249fe0e67
{% endblock %}

{% block lib_deps %}
lib/c
lib/linux
{% endblock %}

{% block bld_tool %}
bld/bash
bld/bison
bld/gettext
{% endblock %}
