{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cagebreak
{% endblock %}

{% block version %}
3.0.0
{% endblock %}

{% block fetch %}
https://github.com/project-repo/cagebreak/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:884cd70445bed1c45116e01e9ddab28b756416b3fb5cc7b6a3057895b64fba03
{% endblock %}

{% block bld_libs %}
lib/c
lib/pango
lib/cairo
lib/wayland
lib/wlroots/18
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
