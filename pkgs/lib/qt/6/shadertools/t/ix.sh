{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v6.4.3.tar.gz
sha:a018883e889540ab828db0b0b49a3c5d810dd7283bb84abf43d1622daf474f7d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
