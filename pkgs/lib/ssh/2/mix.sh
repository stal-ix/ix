{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/libssh2/libssh2/archive/refs/tags/libssh2-1.10.0.tar.gz
7c57b40225a45625582a76f5ad09d4f6
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/z/mix.sh
lib/openssl/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block env %}
export COFLAGS="--with-libssh2=${out} \${COFLAGS}"
{% endblock %}
