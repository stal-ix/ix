{% extends '//die/c/meson.sh' %}

{% block version %}
1.0.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/wayland-info-{{self.version().strip()}}/wayland-utils-wayland-info-{{self.version().strip()}}.tar.bz2
sha:a12f3278b4cc0a26f5f84c0e9f1df0338d0d60c33162d2f521e572b62e723f0a
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock%}

{% block bld_tool %}
bld/wayland
{% endblock %}
