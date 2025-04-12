{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.14.1
{% endblock %}

{% block fetch %}
https://github.com/flatpak/xdg-desktop-portal-gtk/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:79992b308246eb9965a1589a321271def3b4bed6a2b84fffd1916f8d6ea3bc9f
{% endblock %}

{% block bld_libs %}
lib/c
lib/dbus
lib/glib
lib/gtk/3
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
bin/xdg/desktop/portal
{% endblock %}

{% block make_flags %}
GDBUS_CODEGEN=gdbus-codegen
GLIB_COMPILE_RESOURCES=glib-compile-resources
{% endblock %}
