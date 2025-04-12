{% extends '//die/c/meson.sh' %}

{% block version %}
2.4.0
{% endblock %}

{% block fetch %}
https://github.com/project-repo/cagebreak/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:5c2d1688a231dd1a311143aa595637078d2161789c735aad994622a021f84e6f
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
