{% extends '//die/c/meson.sh' %}

{% block version %}
1.0.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/wayland-utils-{{self.version().strip()}}/wayland-utils-wayland-utils-{{self.version().strip()}}.tar.bz2
sha:5e0ef829b85478e2af525c543493653cea34a180fb7f77bbbba88bf39961a708
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock%}

{% block bld_tool %}
bld/wayland
{% endblock %}
