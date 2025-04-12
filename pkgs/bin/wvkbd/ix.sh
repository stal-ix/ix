{% extends '//die/c/make.sh' %}

{% block version %}
0.16
{% endblock %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:1d58f43447d612c5d63b48db224175050e38f31f52032ae9328b051c25040ee4
{% endblock %}

{% block bld_libs %}
lib/c
lib/pango
lib/cairo
lib/kernel
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
{% endblock %}
