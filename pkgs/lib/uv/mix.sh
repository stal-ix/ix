{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v1.43.0.tar.gz
da212b6d2b627f99492168d5d3ce6da6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}
