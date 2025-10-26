{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
file-roller
{% endblock %}

{% block version %}
44.6
{% endblock %}

{% block fetch %}
https://github.com/GNOME/file-roller/archive/refs/tags/{{self.version().strip()}}.tar.gz
57567a1d8320aaba9131832aadce72a8845052e8105c0734cc2713b323f911a1
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
