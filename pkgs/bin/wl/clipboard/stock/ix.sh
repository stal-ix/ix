{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wl-clipboard
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://github.com/bugaevc/wl-clipboard/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b4dc560973f0cd74e02f817ffa2fd44ba645a4f1ea94b7b9614dacc9f895f402
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
