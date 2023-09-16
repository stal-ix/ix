{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v0.14.tar.gz
sha:5ed5e9d0eb316c41e39c239d7361e2857dec44b27a74e207bb82f1bb7442778d
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
