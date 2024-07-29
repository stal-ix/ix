{% extends '//die/c/make.sh' %}

{% block fetch %}
https://codeberg.org/dwl/dwl/archive/v0.6.tar.gz
sha:50b96ae5d11dc269b24e2aa021eb4c2eb6e37c58ccae215bc3e1f0c19013ec0f
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/wlroots/17
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bld/wayland
{% endblock %}
