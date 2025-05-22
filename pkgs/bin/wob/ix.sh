{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wob
{% endblock %}

{% block version %}
0.16
{% endblock %}

{% block fetch %}
https://github.com/francma/wob/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:8a5850beec72b5b19be631a6eb21315a20082bf9135447080f9e9045f143938b
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
