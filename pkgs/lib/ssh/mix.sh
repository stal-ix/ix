{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://www.libssh.org/files/0.9/libssh-0.9.5.tar.xz
6211e47ba4dfd7f7e9f8a17a601245f4
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/c/mix.sh
lib/c++/mix.sh
lib/openssl/mix.sh
{% endblock %}

{% block env %}
export COFLAGS="--with-libssh=${out} \${COFLAGS}"
{% endblock %}
