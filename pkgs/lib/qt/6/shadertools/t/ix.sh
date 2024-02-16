{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v6.6.2.tar.gz
sha:c6d06a660779990f69b8b2e21eb01ada784f9144cbaeb718ee0da01c33ce2141
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
