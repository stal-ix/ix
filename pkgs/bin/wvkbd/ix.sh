{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v0.12.tar.gz
sha:b45cea0835bed77e7fb2d070b8df5abdddd16958b2548fc2da3afb6c579cf268
{% endblock %}

{% block bld_libs %}
lib/c
lib/pango
lib/cairo
lib/kernel
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
{% endblock %}
