{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/bugaevc/wl-clipboard/archive/refs/tags/v2.2.0.tar.gz
sha:414005cfa229d0e54f89a0d9a8473938e4c29adc21a9e556847a4d44ad508874
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
