{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v6.7.2.tar.gz
sha:256ff8199d9f6e97bef57f602c5fa7a32e3c7588bf7efe39e412b810c7ed4ffc
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
