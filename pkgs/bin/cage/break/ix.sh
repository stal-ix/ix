{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cagebreak
{% endblock %}

{% block version %}
3.0.1
{% endblock %}

{% block fetch %}
https://github.com/project-repo/cagebreak/archive/refs/tags/{{self.version().strip()}}.tar.gz
31e5a7860d0eef21c3bd2a848ae98a019df2cd1d2b8943918ad1c680d3ee0511
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
