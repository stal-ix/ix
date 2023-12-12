{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/zathura/-/archive/0.5.4/zathura-0.5.4.tar.bz2
sha:ef3a52d34c208617ae5003944912dca46be8b23c4ba248abddf183614ca45f46
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
lib/cairo
lib/girara
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*export_dynamic.*||' -i meson.build
{% endblock %}
