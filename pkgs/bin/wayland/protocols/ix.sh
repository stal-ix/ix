{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayland-protocols
{% endblock %}

{% block version %}
1.43
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/{{self.version().strip()}}/wayland-protocols-{{self.version().strip()}}.tar.bz2
sha:6fe9872d5f884a2ac4d65ecee49dce2f1672b022af9bcccfea7950086808e093
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
