{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/francma/wob/archive/refs/tags/0.15.tar.gz
sha:78a031cc963b0f1095ecd9127aa16a50f244dd2bdea40e2670be00086cfe7b95
{% endblock %}

{% block bld_libs %}
lib/c
lib/inih
lib/kernel
lib/seccomp
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
