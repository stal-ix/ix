{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.7.0.tar.gz
sha:d9b7699ac83f695cd77260bf4d1f4c3682cc180e84d4e54b2979e882b91326fb
{% endblock %}

{% block cmake_flags %}
ENABLE_UNZIP=OFF
ENABLE_OPENSSL=OFF
ENABLE_LIBGCC=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}
