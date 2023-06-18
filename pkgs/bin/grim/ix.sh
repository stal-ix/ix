{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~emersion/grim/archive/v1.4.1.tar.gz
sha:5ed8e70fcd83a7e203e92d34dbb82a1342d3f13ad98a6b0310cc97e1a9342ded
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/jpeg
lib/pixman
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
