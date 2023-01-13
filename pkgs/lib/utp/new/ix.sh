{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/transmission/libutp/archive/bf695bdfb047cdca9710ea9cffc4018669cf9548.zip
sha:6696fc6eedb882c9ce5cfb8adb68030c81a31247f7d585a95ad6d83ad50eabdb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block cmake_flags %}
LIBUTP_ENABLE_INSTALL=ON
LIBUTP_ENABLE_WERROR=OFF
LIBUTP_BUILD_PROGRAMS=OFF
{% endblock %}
