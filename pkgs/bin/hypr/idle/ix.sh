{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hypridle
{% endblock %}

{% block version %}
0.1.8
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hypridle/archive/refs/tags/v{{self.version().strip()}}.tar.gz
08703613cc33cc796c2179bcaa6076e8618113f67b938daaf7535f90c7d39595
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/wayland
lib/hypr/lang
lib/sd/bus/c++/2
{% endblock %}

{% block bld_tool %}
bld/wayland
bin/hypr/wayland/scanner
bin/hypr/wayland/protocols
{% endblock %}
