{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pango
{% endblock %}

{% block version %}
1.56.3
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/pango/-/archive/{{self.version().strip()}}/pango-{{self.version().strip()}}.tar.bz2
sha:f57538307be7db3c44a731a1966393366fb4d017f47876573a534595585f033c
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
