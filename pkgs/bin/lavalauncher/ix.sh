{% extends '//die/c/meson.sh' %}

{% block version %}
2.1.1
{% endblock %}

{% block pkg_name %}
lavalauncher
{% endblock %}

{% block fetch %}
https://git.sr.ht/~leon_plickat/lavalauncher/archive/v{{self.version().strip()}}.tar.gz
951edb0e00a118cd57d54349349d4898cfc18c6208a7c4d7f6e892eec1497c3b
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/kernel
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
