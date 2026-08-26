{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
file-roller
{% endblock %}

{% block version %}
44.7
{% endblock %}

{% block fetch %}
https://github.com/GNOME/file-roller/archive/refs/tags/{{self.version().strip()}}.tar.gz
86533212a24cf4581023d4c6f74d40d003234ad978b09b013cecd9675131fd45
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/portal
lib/adwaita
lib/archive
lib/gtk/deps
{% endblock %}

{% block bld_tool %}
bld/fake/er(tool_name=itstool)
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
