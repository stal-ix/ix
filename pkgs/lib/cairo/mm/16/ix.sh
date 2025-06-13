{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cairomm
{% endblock %}

{% block version %}
1.16.1
{% endblock %}

{% block fetch %}
https://www.cairographics.org/releases/cairomm-{{self.version().strip()}}.tar.xz
6f6060d8e98dd4b8acfee2295fddbdd38cf487c07c26aad8d1a83bb9bff4a2c6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/cairo
lib/sigc++/3
{% endblock %}
