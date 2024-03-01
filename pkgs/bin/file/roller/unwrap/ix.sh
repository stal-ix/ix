{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://github.com/GNOME/file-roller/archive/refs/tags/43.1.tar.gz
sha:f564f9ad6faf0bfd634b8986242b847ddf457040e9bbf62be286fa2d20e25e54
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/handy
lib/portal
lib/archive
lib/gtk/deps
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/fake/er(tool_name=itstool)
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
