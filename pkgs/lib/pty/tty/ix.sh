{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://dist.schmorp.de/libptytty/libptytty-2.0.tar.gz
8033ed3aadf28759660d4f11f2d7b030acf2a6890cb0f7926fb0cfa6739d31f7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_SHARED_LIBS=OFF
UTMP_SUPPORT=OFF
WTMP_SUPPORT=OFF
LASTLOG_SUPPORT=OFF
{% endblock %}
