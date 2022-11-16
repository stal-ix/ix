{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v2.38.1.tar.gz
sha:75add98ee04e8ca742e860dd06936379737465149904152175a64708de399125
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
