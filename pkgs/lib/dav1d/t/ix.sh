{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dav1d
{% endblock %}

{% block version %}
1.5.1
{% endblock %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/{{self.version().strip()}}.tar.gz
fa635e2bdb25147b1384007c83e15de44c589582bb3b9a53fc1579cb9d74b695
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}

{% block meson_flags %}
enable_examples=false
enable_tests=false
{% endblock %}
