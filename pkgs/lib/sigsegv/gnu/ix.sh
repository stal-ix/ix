{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libsigsegv
{% endblock %}

{% block version %}
2.14
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-{{self.version().strip()}}.tar.gz
sha:cdac3941803364cf81a908499beb79c200ead60b6b5b40cad124fd1e06caa295
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env %}
export COFLAGS="--with-libsigsegv --with-libsigsegv-prefix=${out} \${COFLAGS}"
{% endblock %}
