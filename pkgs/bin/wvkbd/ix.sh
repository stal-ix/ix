{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jjsullivan5196/wvkbd/archive/refs/tags/v0.14.3.tar.gz
sha:2491b0db809442bbb171c2dc8e2867ec26906fffaeb6bf559477bebd31ef35c2
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
