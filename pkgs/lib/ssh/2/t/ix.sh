{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libssh2
{% endblock %}

{% block version %}
1.11.1
{% endblock %}

{% block fetch %}
https://github.com/libssh2/libssh2/archive/refs/tags/libssh2-{{self.version().strip()}}.tar.gz
82b35c61c78b475647bdc981a183c5b5ab0d979e1caee94186e8f9150f2b0d0d
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block env %}
export COFLAGS="--with-libssh2=${out} \${COFLAGS}"
{% endblock %}
