{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/djpohly/dwl/archive/refs/tags/v0.3.1.tar.gz
sha:5d550b0ee6d99d0b537269b8389af4b95d1ab0b63e7bb8c2309f6c57a2d6c9c9
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/wlroots/15
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bin/wayland/protocols
{% endblock %}
