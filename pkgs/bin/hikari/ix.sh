{% extends '//die/c/make.sh' %}

{% block fetch %}
https://hikari.acmelabs.space/releases/hikari-2.3.3.tar.gz
sha:40736ff326e11a51128c1739051a692ad2c79173fc4b695c8be5ec7a614b4de2
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/pango
lib/cairo
lib/input
lib/wlroots
lib/wayland
lib/xkbcommon
lib/ucl/parser
lib/drivers/3d
{% endblock %}

{% block make_bin %}bmake{% endblock %}

{% block bld_tool %}
bld/bmake
bld/pkg/config
bld/wayland
{% endblock %}

{% block make_flags %}
WITH_POSIX_C_SOURCE=YES
{% endblock %}
