{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v2.39.1.tar.gz
sha:d8db91a48ba96f11a981a39e75e395af9aad7d65e08a8601680abfdd3af5c2bd
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

{% block autoreconf %}
export LT_OPTS=-ci
{{super()}}
{% endblock %}
