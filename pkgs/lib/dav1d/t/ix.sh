{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dav1d
{% endblock %}

{% block version %}
1.5.2
{% endblock %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/{{self.version().strip()}}.tar.gz
2fc0810b4cdf72784b3c107827ff10b1d83ec709a1ec1fbdbc6a932daf65ead6
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
