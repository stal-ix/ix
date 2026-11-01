{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtshadertools
{% endblock %}

{% block version %}
6.12.0
{% endblock %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ced35453e0420193c345019ee8952af018fbab3fe04cf991a778fb8537907e86
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
