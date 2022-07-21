{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/kraxarn/spotify-qt/archive/refs/tags/v3.9.tar.gz
sha:db1bc50fe4f31fc021db722eb85e59db543a104255a0a07f2e923d7a69195e42
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/svg
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block cmake_flags %}
USE_QT6=ON
USE_QT5=OFF
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}
