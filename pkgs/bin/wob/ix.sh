{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/francma/wob/archive/refs/tags/0.14.2.tar.gz
sha:898e98fa3070efe1f87a6328c7dc1fb4291cf512fa47ede6843506a046bb1851
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
