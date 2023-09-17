{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/francma/wob/archive/refs/tags/0.15.1.tar.gz
sha:094f666e799a7fa0914192d041032f4e9a28a87486d024db80ade010988b218a
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
