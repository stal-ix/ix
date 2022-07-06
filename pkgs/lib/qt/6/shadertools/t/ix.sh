{% extends '//die/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v6.3.0.tar.gz
sha:3c36d83fc036a144722ce056b2840260005dcbd338e11b9c527d7266a54afd45
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
