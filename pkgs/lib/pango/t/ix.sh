{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pango
{% endblock %}

{% block version %}
1.58.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/pango/-/archive/{{self.version().strip()}}/pango-{{self.version().strip()}}.tar.bz2
57e535178a70927a6831f704c1b8baf391152f45a2cee6fb9d4d7cc6a309b840
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

{% block step_patch %}
{{super()}}
sed -e '/#include <hb-ft.h>/a #include <fontconfig/fcfreetype.h>' -i pango/pangofc-fontmap.c
{% endblock %}
