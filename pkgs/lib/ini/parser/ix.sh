{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ndevilla/iniparser/archive/refs/tags/v4.2.4.tar.gz
sha:c05bb41df87f31a029516943ebb7f38ca1f0e38ff36f3836f1163a9a529857df
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_EXAMPLES=OFF
BUILD_DOCS=OFF
{% endblock %}
