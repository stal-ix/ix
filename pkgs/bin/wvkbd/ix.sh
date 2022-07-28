{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v0.9.tar.gz
sha:bb9de4e2861418ebbc8bb34014d3fcf3ba02adfb4d86d5b87b3ebe45da490b15
{% endblock %}

{% block bld_libs %}
lib/c
lib/pango
lib/linux
lib/cairo
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
{% endblock %}
