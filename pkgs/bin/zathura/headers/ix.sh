{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/zathura/-/archive/0.5.5/zathura-0.5.5.tar.bz2
sha:266d67cf6e34dc92c86018137ad095b48aa70deeb51d9a999df2bf803b29a71e
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
lib/cairo
lib/girara
lib/sqlite/3
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*export_dynamic.*||' -i meson.build
{% endblock %}
