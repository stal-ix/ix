{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v6.4.2.tar.gz
sha:7f29a78769f454fe529595acb693aa67812e80d894162ddad3f0444f65a22268
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
