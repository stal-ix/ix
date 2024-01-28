{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/project-repo/cagebreak/archive/refs/tags/2.3.1.tar.gz
sha:0ea5e896e710c8b89485d13149e58b73b5f6fed53b3a173dfc558b600b2bf413
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
