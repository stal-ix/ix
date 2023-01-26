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
{% endblock %}

{% block patch %}
# need itstool
sed -e 's|.*subdir.*help.*||' -e 's|.*subdir.*po.*||' -i meson.build
{% endblock %}
