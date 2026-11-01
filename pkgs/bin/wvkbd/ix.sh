{% extends '//die/c/make.sh' %}

{% block pkg_name %}
wvkbd
{% endblock %}

{% block version %}
0.21
{% endblock %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e0a88358cf5a76f812a766f9323a2633da1297bfb11a1e38d420689efdd26f9d
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
