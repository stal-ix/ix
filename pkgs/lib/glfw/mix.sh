{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/glfw/glfw/archive/refs/tags/3.3.5.tar.gz
e4b7c1be5db32e0f11c073b3f6bfdd4a
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
{% endblock %}
