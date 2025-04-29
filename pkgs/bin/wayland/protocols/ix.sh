{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayland-protocols
{% endblock %}

{% block version %}
1.44
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/{{self.version().strip()}}/wayland-protocols-{{self.version().strip()}}.tar.bz2
sha:4bc328e7c879c196d623b95849669cd1d6e48756e049663ff2a355522bede3c4
{% endblock %}

{% block bld_tool %}
bld/wayland/scanner
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/wayland
{% endblock %}

{% block strip_pc %}
{% endblock %}

{% block env %}
export WL_PROTOCOL_DIR=${out}/share/wayland-protocols
{% endblock %}
