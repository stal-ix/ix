{% extends '//die/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/console/-/archive/42.2/console-42.2.tar.bz2
sha:db9b2883483c138c2734d794da3a9809acafef39626f4632d536fe7dddc7ce14
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
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('kgx')}}
{% endblock %}
