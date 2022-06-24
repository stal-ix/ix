{% extends '//die/cmake.sh' %}

{% block fetch %}
https://libzip.org/download/libzip-1.9.0.tar.xz
sha:a17240ee88f0705a9067bb0087fde1cee73948b3cf6c3978a21a58fdb73b76a2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/zstd
lib/bzip/2
lib/openssl
{% endblock %}
