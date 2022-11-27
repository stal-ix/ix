{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v6.4.1.tar.gz
sha:d325724c4ed79c759ac8cbbca5f9fd4b0e6e8d61a9ac58921cb1dac75c104687
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
