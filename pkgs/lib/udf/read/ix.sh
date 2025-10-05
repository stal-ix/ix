{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libudfread
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://code.videolan.org/videolan/libudfread/-/archive/{{self.version().strip()}}/libudfread-{{self.version().strip()}}.tar.bz2
b7febc6c05af412d0dac20039a76438739986be9b22f8451a4babe69e06a2543
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
