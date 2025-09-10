{% extends '//die/c/make.sh' %}

{% block pkg_name %}
wvkbd
{% endblock %}

{% block version %}
0.18
{% endblock %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4cd4e32490fba7913a9053645ce2a8d453c596bb3dd780631b8656d746327de6
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
