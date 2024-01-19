{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-terminal/-/archive/3.50.1/gnome-terminal-3.50.1.tar.bz2
sha:df32b4e5a791e12003ed9179d537767218026eb6d578adb7c481cc830aa98558
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/vte
lib/glib
lib/handy
# uuid
lib/linux/util
lib/gsettings/desktop/schemas
# dlsym autodetect
lib/musl/dlfcn
{% endblock %}

{% block meson_flags %}
docs=false
nautilus_extension=false
search_provider=false
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gettext
bld/fake/er(tool_name=itstool)
bld/fake/er(tool_name=xsltproc)
{% endblock %}

{% block patch %}
sed -e 's|W_EXITCODE.*|SIGKILL << 8;|' -i src/terminal.cc
{% endblock %}

{% block c_rename_symbol %}
g_module_open
{% endblock %}
