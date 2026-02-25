{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dav1d
{% endblock %}

{% block version %}
1.5.3
{% endblock %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/{{self.version().strip()}}.tar.gz
cbe212b02faf8c6eed5b6d55ef8a6e363aaab83f15112e960701a9c3df813686
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
