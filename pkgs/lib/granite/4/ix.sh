{% extends '//die/vala/meson.sh' %}

{% block fetch %}
https://github.com/elementary/granite/archive/refs/tags/7.6.0.tar.gz
sha:4b4e4f7f86eb3f55116faec42ebd87e04c3e424d82715ecd967ed39540dca5ef
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
