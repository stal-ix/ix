{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
girara
{% endblock %}

{% block version %}
0.4.5
{% endblock %}

{% block fetch %}
https://github.com/pwmt/girara/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:9abb84fdb3f8f51e8aef8d53488fd0631357f0713ad5aa4a5c755c23f54b23df
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
lib/json/glib
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}
