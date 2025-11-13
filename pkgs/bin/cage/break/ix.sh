{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cagebreak
{% endblock %}

{% block version %}
3.1.0
{% endblock %}

{% block fetch %}
https://github.com/project-repo/cagebreak/archive/refs/tags/{{self.version().strip()}}.tar.gz
af247b2d4b1eb19e2ce2c80b05d68fcc4b0a2f5637669af3644c36edb14c2b70
{% endblock %}

{% block bld_libs %}
lib/c
lib/pango
lib/cairo
lib/wayland
lib/wlroots/19
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
