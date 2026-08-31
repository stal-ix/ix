{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayland-utils
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/{{self.version().strip()}}/wayland-utils-{{self.version().strip()}}.tar.bz2
898ceff3007b11aaec5b13844ac673b99ee186b2706b9b2ab41ba6be8c29ad06
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock%}

{% block bld_tool %}
bld/wayland
{% endblock %}
