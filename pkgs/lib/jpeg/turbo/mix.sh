{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/2.1.2.tar.gz
f02d78311298468c5c1d278507ad42f2
{% endblock %}

{% block bld_tool %}
dev/lang/nasm/mix.sh
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/z/mix.sh
lib/png/mix.sh
{% endblock %}

{% block cmake_flags %}
ENABLE_SHARED=OFF
{% endblock %}
