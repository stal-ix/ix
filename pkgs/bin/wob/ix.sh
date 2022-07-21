{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/francma/wob/archive/refs/tags/0.12.tar.gz
sha:c4442fb43ab0d47c986d0c0041a385e1e66f7c16fc48ff0651993deb0d00ed01
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/seccomp
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/scdoc
bin/wayland/scanner
bin/wayland/protocols
{% endblock %}
