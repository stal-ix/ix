{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v6.3.0.tar.gz
sha:a5667696cc673e4bc77c0c6731432a72e4933145b58dd8e35d27f0db13d69b0e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block setup %}
export CMAKE_PREFIX_PATH="${lib_qt_6_base}"
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): proper solution'
{% endblock %}
