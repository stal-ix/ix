{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/Igalia/cog/archive/refs/tags/0.12.4.tar.gz
sha:6ded83243466081d6c12e7cafda3807cf94b4e90859d3112d8211b325c6c5cbc
{% endblock %}

{% block bld_libs %}
lib/c
lib/wpe
lib/input
lib/wayland
lib/web/kit/wpe
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
USE_SOUP2=OFF
{% endblock %}
