{% extends '//die/c/meson.sh' %}

{% block version %}
1.5.1
{% endblock %}

{% block pkg_name %}
wofi
{% endblock %}

{% block fetch %}
https://hg.sr.ht/~scoopta/wofi/archive/v{{self.version().strip()}}.tar.gz
d432d8f2c3f1d66716dc29e9fea7bb52cd319377c7faddf326491a9e92c188cb
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
