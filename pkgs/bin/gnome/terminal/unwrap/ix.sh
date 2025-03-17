{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://github.com/GNOME/gnome-terminal/archive/refs/tags/3.56.0.tar.gz
sha:aaa248152c62a51657367376d1c3262ce7c09d5c8321b30de63043a6de3720b1
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
