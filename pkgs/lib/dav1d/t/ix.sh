{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dav1d
{% endblock %}

{% block version %}
1.5.4
{% endblock %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/{{self.version().strip()}}.tar.gz
a1d5b63d2d38ec9bd03acf643caa51fa22edd1e89c5a109c4807717216bbec07
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
