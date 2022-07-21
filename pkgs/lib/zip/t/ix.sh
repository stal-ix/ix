{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://libzip.org/download/libzip-1.9.1.tar.xz
sha:425f94fe9d23fefdc2261618a62afaea6b25803d47da4f9babf85f6f2f6b49af
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/zstd
lib/bzip/2
lib/openssl
{% endblock %}
