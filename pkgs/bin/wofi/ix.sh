{% extends '//die/c/meson.sh' %}

{% block version %}
1.5
{% endblock %}

{% block pkg_name %}
wofi
{% endblock %}

{% block fetch %}
https://hg.sr.ht/~scoopta/wofi/archive/v{{self.version().strip()}}.tar.gz
4d1bb206584c4592cb3e5b369cc10cab754427a20742bb9380f308eafae45523
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
