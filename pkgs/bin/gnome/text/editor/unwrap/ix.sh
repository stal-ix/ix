{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gnome-text-editor
{% endblock %}

{% block version %}
50.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/{{self.version().strip()}}/gnome-text-editor-{{self.version().strip()}}.tar.bz2
a2b569a74bbb35a24ca4084044e3b4fd0798cb66447ae571aa3f87203c37cdf0
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
lib/spelling
lib/gtk/source/view/5
lib/editor/config/core/c
lib/gsettings/desktop/schemas
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
