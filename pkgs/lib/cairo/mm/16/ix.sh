{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cairomm
{% endblock %}

{% block version %}
1.16.2
{% endblock %}

{% block fetch %}
https://www.cairographics.org/releases/cairomm-{{self.version().strip()}}.tar.xz
6a63bf98a97dda2b0f55e34d1b5f3fb909ef8b70f9b8d382cb1ff3978e7dc13f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/cairo
lib/sigc++/3
{% endblock %}
