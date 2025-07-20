{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
geany
{% endblock %}

{% block version %}
2.1.0
{% endblock %}

{% block fetch %}
https://github.com/geany/geany/archive/refs/tags/{{self.version().strip()}}.tar.gz
95a9bfa1c176684fb6ccd528ba9c948f0c2d777d2370bb0e9c3502ea575ceb3d
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}
