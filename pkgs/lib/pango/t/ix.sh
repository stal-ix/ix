{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pango
{% endblock %}

{% block version %}
1.57.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/pango/-/archive/{{self.version().strip()}}/pango-{{self.version().strip()}}.tar.bz2
981cdc6b0040a44e6f73fe084aa1be56d3070955fc7ffa10ec262b711a7da214
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
