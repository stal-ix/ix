{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/42.0/gnome-text-editor-42.0.tar.bz2
sha:4c94073c30ee6ad054ac5883f6720fac63ac3344621498cf09728f7f83018d7e
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/glib
lib/gtk/4
lib/pcre/2
lib/adwaita
lib/gtk/source/view
{% endblock %}

{% block bld_tool %}
bin/gettext
bin/glib/codegen
{% endblock %}

{% block meson_flags %}
enchant=disabled
{% endblock %}

{% block setup_tools %}
cat << EOF > gtk-update-icon-cache
#!$(which sh)
EOF

chmod +x gtk-update-icon-cache

cat << EOF > update-desktop-database
#!$(which sh)
EOF

chmod +x update-desktop-database
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}

{% import '//mix/hooks.sh' as hooks %}

{% block install %}
{{hooks.install_glib_schemas()}}
{{super()}}
{{hooks.wrap_xdg_binary('gnome-text-editor')}}
{% endblock %}
