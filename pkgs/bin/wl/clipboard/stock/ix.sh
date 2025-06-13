{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wl-clipboard
{% endblock %}

{% block version %}
2.2.1
{% endblock %}

{% block fetch %}
https://github.com/bugaevc/wl-clipboard/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6eb8081207fb5581d1d82c4bcd9587205a31a3d47bea3ebeb7f41aa1143783eb
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
zshcompletiondir=${out}/share/zsh
fishcompletiondir=${out}/share/fish
{% endblock %}
