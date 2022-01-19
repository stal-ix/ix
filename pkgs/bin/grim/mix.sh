{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/emersion/grim/archive/refs/tags/v1.3.2.tar.gz
950ebba448f2069bef1e404a14f8db13
{% endblock %}

{% block bld_libs %}
lib/c
lib/jpeg
lib/cairo
lib/wayland
{% endblock %}

{% block bld_tool %}
lib/wayland/protocols
{% endblock %}
