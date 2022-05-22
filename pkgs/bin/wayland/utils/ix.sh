{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/wayland-utils-1.0.0/wayland-utils-wayland-utils-1.0.0.tar.bz2
sha:5e0ef829b85478e2af525c543493653cea34a180fb7f77bbbba88bf39961a708
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock%}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}
