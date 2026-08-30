{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libunibreak
{% endblock %}

{% block version %}
7.0
{% endblock %}

{% block fetch %}
https://github.com/adah1972/libunibreak/archive/refs/tags/libunibreak_{{self.version().strip().replace('.', '_')}}.tar.gz
e4cb1a0d9aebb129c9856ec75e3d98e675997e385cce4e0106ef8f68e09afaa3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
