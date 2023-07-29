{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.7.1.tar.gz
sha:593544415765dd2e160fe132adb1513930b36c431de611b5eb3d98ba663bc995
{% endblock %}

{% block cmake_flags %}
ENABLE_UNZIP=OFF
ENABLE_OPENSSL=OFF
ENABLE_LIBGCC=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}
