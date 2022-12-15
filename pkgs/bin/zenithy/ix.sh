{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/zenity/-/archive/3.43.0/zenity-3.43.0.tar.bz2
sha:64c734a98b14fd276c7316596046779d46358bd7fdc07d29302fe3c7d853bdaa
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
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
