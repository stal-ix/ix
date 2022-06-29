{% extends '//die/meson.sh' %}

{% block fetch %}
#https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/1.25/wayland-protocols-1.25.tar.bz2
#sha:8a86df9cfbdc5527e95f789eee0212928324a69bc6ca69d24d0a5cf8744cb467
https://github.com/wayland-project/wayland-protocols/archive/refs/tags/1.25.tar.gz
sha:4326e2b5e04e459ab4522e83e19bff101a3faf9b085bcf46b6cabbd392cc4458
{% endblock %}

{% block bld_tool %}
bin/wayland/scanner
{% endblock %}

{% block run_deps %}
bin/wayland/scanner
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/wayland
{% endblock %}

{% block strip_pc %}
{% endblock %}
