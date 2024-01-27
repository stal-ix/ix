{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/project-repo/cagebreak/archive/refs/tags/2.3.0.tar.gz
sha:fd18e9d3cfffb8369dd850d329765687fbbda4dcb1bc3e846b683b2a6ac4d739
{% endblock %}

{% block bld_libs %}
lib/c
lib/pango
lib/cairo
lib/wayland
lib/wlroots/17
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e "s|/usr/share|${out}/share|" \
    -e "s|/etc/xdg|${out}/share/xdg|" \
    -i meson.build
{% endblock %}
