{% extends '//die/c/gnome.sh' %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/notify
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gettext
bld/fake(tool_name=itstool)
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
