{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/francma/wob/archive/refs/tags/0.14.tar.gz
sha:967db56fce7e3e39d220f751b53168d76c5a85fa3601e89d175ac2da294dab83
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
