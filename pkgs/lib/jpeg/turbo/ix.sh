{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/2.1.4.tar.gz
sha:a78b05c0d8427a90eb5b4eb08af25309770c8379592bb0b8a863373128e6143f
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_SHARED=OFF
{% endblock %}
