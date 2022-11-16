{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v0.11.tar.gz
sha:6c6b3154d52acb762cd3b247f22fdf35f2eafa462ea5039ad75653d28e6972db
{% endblock %}

{% block bld_libs %}
lib/c
lib/pango
lib/kernel
lib/cairo
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
{% endblock %}
