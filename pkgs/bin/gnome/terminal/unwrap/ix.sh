{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gnome-terminal
{% endblock %}

{% block version %}
3.60.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gnome-terminal/archive/refs/tags/{{self.version().strip()}}.tar.gz
6c006523d2c21282fd62c64fc44f63546aaa216e66eb439b8129af68db11df7c
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
