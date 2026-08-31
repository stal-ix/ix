{% extends '//die/c/meson.sh' %}

{% block version %}
1.5.3
{% endblock %}

{% block pkg_name %}
wofi
{% endblock %}

{% block fetch %}
https://hg.sr.ht/~scoopta/wofi/archive/v{{self.version().strip()}}.tar.gz
6216dc14d93cdb6170f89c1ca3aaacdeaa44862fbc9be947d614be266a9c49f6
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/wayland
lib/shim/exit
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
