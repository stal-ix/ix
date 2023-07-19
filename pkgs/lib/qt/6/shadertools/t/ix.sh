{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v6.5.2.tar.gz
sha:2b14cf982753f19cf48a4780bc7d96d8fc0ad3ed1049ae5d3292fc5fc1fd6aef
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
