{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v1.43.0.tar.gz
da212b6d2b627f99492168d5d3ce6da6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}
