{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fribidi
{% endblock %}

{% block version %}
1.0.18
{% endblock %}

{% block fetch %}
https://github.com/fribidi/fribidi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
01f15887e32a9d84503121e2da031f166ac07ca8e0c350aef2dbbeaad0f75b1d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
docs=false
tests=false
{% endblock %}
