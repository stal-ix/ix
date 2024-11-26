{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://github.com/GNOME/gnome-terminal/archive/refs/tags/3.54.2.tar.gz
sha:101e69d2c4abec2789e01605588d09e43d8a65fdf327e13b74d78773c71f55b5
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

{% block c_rename_symbol %}
g_module_open
{% endblock %}
