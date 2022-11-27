{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/zathura/-/archive/0.5.2/zathura-0.5.2.tar.bz2
sha:48e85b47c1a8d71767433be02ae4d07ae5ca7ba235762ad89c0c5119b12838e0
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
lib/cairo
lib/girara
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib
{% endblock %}

{% block patch %}
sed -e 's|.*export_dynamic.*||' -i meson.build
{% endblock %}
