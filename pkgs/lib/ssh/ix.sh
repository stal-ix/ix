{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://www.libssh.org/files/0.9/libssh-0.9.5.tar.xz
md5:6211e47ba4dfd7f7e9f8a17a601245f4
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
lib/openssl
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libssh=${out} \${COFLAGS}"
{% endblock %}
