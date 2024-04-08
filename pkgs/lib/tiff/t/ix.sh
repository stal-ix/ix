{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/faxguy/libtiff-tools/-/archive/v4.6.0t/libtiff-tools-v4.6.0t.tar.bz2
sha:80f1b2ffd1c4b12c19bd5e716c5af10b1feac185c74266d4d1d6d0eeab6461ba
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/c++
lib/jpeg
lib/zstd
lib/webp
lib/deflate
{% endblock %}

{% block cmake_flags %}
tiff-contrib=OFF
tiff-docs=OFF
tiff-tests=OFF
{% endblock %}
