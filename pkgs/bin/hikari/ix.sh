{% extends '//die/c/make.sh' %}

{% block pkg_name %}
hikari
{% endblock %}

{% block version %}
2.3.3
{% endblock %}

{% block fetch %}
https://github.com/antaz/hikari/archive/refs/tags/{{self.version().strip()}}.tar.gz
f9ca23c79944738894411de3f5c2afe5e81a48f3de8eb03ecd2bc85590ad99d0
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
