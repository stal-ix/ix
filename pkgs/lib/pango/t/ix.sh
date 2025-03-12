{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/pango/-/archive/1.56.2/pango-1.56.2.tar.bz2
sha:dd45737946ffec9ccf589209caed19dee437d36d61ac92dfb42f7e99be8c46f3
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
