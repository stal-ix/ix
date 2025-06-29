{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pango
{% endblock %}

{% block version %}
1.56.4
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/pango/-/archive/{{self.version().strip()}}/pango-{{self.version().strip()}}.tar.bz2
e90ce0396d2c05f241b8b8398e9e5523b7b48a2aaf819947d9ccd3b5ec2940ba
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/cairo
lib/fribidi
lib/freetype
lib/harfbuzz
lib/execinfo
lib/fontconfig
{% endblock %}

{% block build_flags %}
{% if darwin %}
# too much -Werrors
shut_up
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}
