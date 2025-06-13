{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
plutovg
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://github.com/sammycage/plutovg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8aa9860519c407890668c29998e8bb88896ef6a2e6d7ce5ac1e57f18d79e1525
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/plutovg \${CPPFLAGS}"
{% endblock %}
