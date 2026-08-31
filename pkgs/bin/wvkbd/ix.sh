{% extends '//die/c/make.sh' %}

{% block pkg_name %}
wvkbd
{% endblock %}

{% block version %}
0.20
{% endblock %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b5fee580f826190fda94c06267e52e7c09f0fbbec2b02e5d140fe62a10a6c3b0
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
