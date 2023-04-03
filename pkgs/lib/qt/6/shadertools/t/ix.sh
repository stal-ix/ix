{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v6.5.0.tar.gz
sha:ef2c71fac111a837914b7dc2b46c26579ea50b05fbd60022d430da88bdb211cb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
