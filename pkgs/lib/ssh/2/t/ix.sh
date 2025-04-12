{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libssh2
{% endblock %}

{% block version %}
1.11.0
{% endblock %}

{% block fetch %}
https://github.com/libssh2/libssh2/archive/refs/tags/libssh2-{{self.version().strip()}}.tar.gz
sha:a842b6778b32d99e3ec83f8d7d1ac449853e41892f3c09bc3d7017e8e246b1cd
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block env %}
export COFLAGS="--with-libssh2=${out} \${COFLAGS}"
{% endblock %}
