{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cairomm
{% endblock %}

{% block version %}
1.14.6
{% endblock %}

{% block fetch %}
https://www.cairographics.org/releases/cairomm-{{self.version().strip()}}.tar.xz
7e0d5c7f29175d573a03ab5c45aef63f48dd91a5caf335a404cd763e4b7cea4a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/cairo
lib/sigc++/2
{% endblock %}
