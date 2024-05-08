{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/sysprof/-/archive/46.0/sysprof-46.0.tar.bz2
sha:c8cb852301ec01b1b2234793249a3674050c96f09f5a9ae3bf8c56a1750ec006
{% endblock %}

{% block bld_libs %}
lib/c
lib/dex
lib/gtk
lib/glib
lib/panel
lib/unwind
lib/adwaita
lib/json/glib
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gettext
bld/fake/er(tool_name=itstool)
{% endblock %}

{% block meson_flags %}
tools=false
systemdunitdir=${out}/share/systemd
{% endblock %}

{% block patch %}
sed -e 's|libsysprof = library|libsysprof = shared_library|' \
    -i src/libsysprof/meson.build
{% endblock %}
