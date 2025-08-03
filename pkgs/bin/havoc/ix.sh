{% extends '//die/c/make.sh' %}

{% block pkg_name %}
havoc
{% endblock %}

{% block version %}
0.7.0
{% endblock %}

{% block fetch %}
https://github.com/ii8/havoc/archive/refs/tags/{{self.version().strip()}}.tar.gz
b4f819bfc3b0f8ea967018948dbf3a71f174a02886d00ee16121739fcd140d6f
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
{% endblock %}
