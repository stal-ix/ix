{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~emersion/kanshi/refs/download/v1.3.1/kanshi-1.3.1.tar.gz
sha:800dd78e3a1a9c0517fc974421432987300c6d0153782e5a71b24b538a906adb
{% endblock %}

{% block bld_libs %}
lib/c
lib/varlink
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
