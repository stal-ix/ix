{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libucontext
{% endblock %}

{% block version %}
1.5
{% endblock %}

{% block fetch %}
https://github.com/kaniini/libucontext/archive/refs/tags/libucontext-{{self.version().strip()}}.tar.gz
b3ca8d7d3e5c926a90ddb691f8a52ccb364069a745304a40c29f3b0d39b80c93
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
cpu={{target.arch}}
{% endblock %}
