{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libxmp
{% endblock %}

{% block version %}
4.6.3
{% endblock %}

{% block fetch %}
https://github.com/libxmp/libxmp/archive/refs/tags/libxmp-{{self.version().strip()}}.tar.gz
sha:0871421a5ac54e7eefe4a5afc89f6411f6382aa7bbff8b916a9f243abe77e85f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
