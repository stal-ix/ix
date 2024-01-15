{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/sebholt/qastools/-/archive/v1.3.0/qastools-v1.3.0.tar.bz2
sha:200beb364dfe492840d695dccd78d2b8d18b713dbb5b27fa2002ff5484295227
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
