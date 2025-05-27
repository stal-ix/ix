{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gnome-terminal
{% endblock %}

{% block version %}
3.56.2
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gnome-terminal/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:ace8f4613da3162d1f857f5722964b4fa002d351228a32d6f94cb16e4c5bf802
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
