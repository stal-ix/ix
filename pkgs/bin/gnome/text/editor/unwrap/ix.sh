{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/45.3/gnome-text-editor-45.3.tar.bz2
sha:c97499700f7a53960f9e57e7eef11884b6bc83d8917741c76233ec2e92a5de58
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/intl
lib/glib
lib/pcre
lib/gtk/4
lib/pcre/2
lib/adwaita
lib/enchant
lib/gtk/deps
lib/gtk/source/view
lib/editor/config/core/c
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
