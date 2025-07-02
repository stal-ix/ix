{% extends '//die/c/make.sh' %}

{% block pkg_name %}
hikari
{% endblock %}

{% block version %}
2.3.3
{% endblock %}

{% block fetch %}
https://hikari.acmelabs.space/releases/hikari-{{self.version().strip()}}.tar.gz
40736ff326e11a51128c1739051a692ad2c79173fc4b695c8be5ec7a614b4de2
{% endblock %}

{% block bld_libs %}
lib/c
{% if linux %}
lib/pam
{% endif %}
lib/pango
lib/cairo
lib/input
lib/wayland
lib/xkb/common
lib/wlroots/15
lib/ucl/parser
lib/drivers/3d
{% endblock %}

{% block make_bin %}bmake{% endblock %}

{% block bld_tool %}
bld/bmake
bld/wayland
bld/pkg/config
{% endblock %}

{% block make_flags %}
WITH_POSIX_C_SOURCE=YES
{% endblock %}
