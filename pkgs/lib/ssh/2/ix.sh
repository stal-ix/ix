{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libssh2/libssh2/archive/refs/tags/libssh2-1.10.0.tar.gz
md5:7c57b40225a45625582a76f5ad09d4f6
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/openssl
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libssh2=${out} \${COFLAGS}"
{% endblock %}
