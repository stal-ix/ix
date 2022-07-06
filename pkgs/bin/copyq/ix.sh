{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/hluk/CopyQ/archive/refs/tags/v6.2.0.tar.gz
sha:d1d46edc7c96e57c44f222b310713a886bc08d2a069756d96f620684d3e71067
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block cmake_flags %}
WITH_QT6=ON
WITH_PLUGINS=OFF
{% endblock %}
