{% extends '//die/vala/meson.sh' %}

{% block fetch %}
https://github.com/elementary/granite/archive/refs/tags/7.5.0.tar.gz
sha:9439733169c07cfc658144ceef90bebac5f024ffda4bbb65e8c1ab68e5580908
{% endblock %}

{% block lib_deps %}
lib/c
lib/gee
lib/gtk/4
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/graphene/gir
lib/gi/repository/gir
lib/harfbuzz/gir
lib/gi/files
{% endblock %}

{% block bld_tool %}
bin/sassc
bld/gnome
bld/gettext
{% endblock %}
