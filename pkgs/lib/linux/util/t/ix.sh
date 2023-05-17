{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v2.39.tar.gz
sha:186cb427cd6b4654f381357b60af7ffb0ae9bb50d7af7d87e0723858f7318b80
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/bash
bld/bison
bld/gettext
{% endblock %}
