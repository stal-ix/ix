{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dav1d
{% endblock %}

{% block version %}
1.5.5
{% endblock %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/{{self.version().strip()}}.tar.gz
76ad07ab121d68407b64a6f50f540c90ca0b066d178bdc9adbea14acf4ce25a9
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
