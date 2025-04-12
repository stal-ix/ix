{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtwayland
{% endblock %}

{% block version %}
6.7.2
{% endblock %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e4cb055bca9a76266821bc2320ff9feaae96eaca0a6a453e99722410b2a5fff2
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
