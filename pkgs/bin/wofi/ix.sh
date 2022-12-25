{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://hg.sr.ht/~scoopta/wofi/archive/v1.2.4.tar.gz
sha:b4e2a54cb7cc0dbfc50a21ded4a5694ca6343c57274efcf600aa128811cccf94
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
