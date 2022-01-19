{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/2.1.2.tar.gz
f02d78311298468c5c1d278507ad42f2
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
{% endblock %}

{% block cmake_flags %}
ENABLE_SHARED=OFF
{% endblock %}
