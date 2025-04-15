{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
file-roller
{% endblock %}

{% block version %}
44.5
{% endblock %}

{% block fetch %}
https://github.com/GNOME/file-roller/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:23f574efdbdc574dee8b853057e5aa7504419138e14c392472902130f94a8f84
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
