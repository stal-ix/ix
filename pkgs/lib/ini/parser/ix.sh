{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ndevilla/iniparser/archive/refs/tags/v4.2.6.tar.gz
sha:a0bd370713a744b1fa8ec27bba889ebf9dbd43060ec92e07fbe91fb43e3cb3ac
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_EXAMPLES=OFF
BUILD_DOCS=OFF
{% endblock %}
