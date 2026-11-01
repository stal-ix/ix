{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtwayland
{% endblock %}

{% block version %}
6.12.0
{% endblock %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6a6ac145aaf34ab742f85ff79d688c5bab9160a1da32e7855c8e7278ff774f3c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/qt/6/base
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
