{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gnome-terminal
{% endblock %}

{% block version %}
3.58.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gnome-terminal/archive/refs/tags/{{self.version().strip()}}.tar.gz
6165f671fb26d8b724f22a185d90212787512e375108b02a27df5069efb846c9
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/vte
lib/glib
lib/handy
lib/shim/wait
lib/linux/util
lib/gsettings/desktop/schemas
{% endblock %}

{% block meson_flags %}
docs=false
nautilus_extension=false
search_provider=false
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/fake/er(tool_name=itstool)
bld/fake/er(tool_name=xsltproc)
{% endblock %}

{% block patch %}
sed -e 's|^g_module_open|xxx_g_module_open|' \
    -i src/server.cc
{% endblock %}
