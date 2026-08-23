{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cagebreak
{% endblock %}

{% block version %}
3.2.1
{% endblock %}

{% block fetch %}
https://github.com/project-repo/cagebreak/archive/refs/tags/{{self.version().strip()}}.tar.gz
9642c05320dcf5fa726060f6cfdf30c47783202eb65b9ef6f7a3fe9931aadeca
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
