{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/console/-/archive/42.beta/console-42.beta.tar.bz2
sha:87bf176d10e6167990682bb92a136e306a499f9953b3bb61675d071a0378b62b
{% endblock %}

{% block bld_libs %}
lib/c
lib/vte
lib/glib
lib/gtop
lib/gtk/3
lib/handy
lib/gtk/deps
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
bin/sassc
bin/gettext
bin/glib/codegen
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
{{hooks.wrap_xdg_binary('kgx')}}
{% endblock %}
