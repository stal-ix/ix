{% extends '//die/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v6.3.1.tar.gz
sha:1b8b18b6ece4d92d0bf60a3b2a9924b45c369968cc77217796434ac7c5c6628f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
