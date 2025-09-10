{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swappy
{% endblock %}

{% block version %}
1.8.0
{% endblock %}

{% block fetch %}
https://github.com/jtheoof/swappy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
11f5bedde6cce4db0d27eb7107d7ce46e20d021255450eeba2c2036e10570520
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/pango
lib/cairo
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/glib
bin/scdoc
bld/gettext
{% endblock %}
