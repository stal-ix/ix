{% extends '//die/c/make.sh' %}

{% block pkg_name %}
wvkbd
{% endblock %}

{% block version %}
0.17
{% endblock %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e3f82302367cdacf7a0c59d6d1bb4f5140083da1b3083da7c835dab0c250034c
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
