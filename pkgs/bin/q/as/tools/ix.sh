{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/sebholt/qastools/-/archive/v1.4.0/qastools-v1.4.0.tar.bz2
sha:1f16a09a8693791b3f450c3de53320ac718309b82115cf6c567623b77b0f7154
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/alsa
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block bld_tool %}
bld/bash
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block cpp_missing %}
sstream
{% endblock %}
