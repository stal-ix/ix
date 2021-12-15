{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v3.22.0.tar.gz
23396af0779893f2c6723faa74da5b85
{% endblock %}

{% block bld_libs %}
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreFoundation/mix.sh
{% endif %}
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
lib/z/mix.sh
lib/xz/mix.sh
lib/uv/mix.sh
lib/c/mix.sh
lib/c++/mix.sh
lib/curl/mix.sh
lib/bzip2/mix.sh
lib/expat/mix.sh
lib/archive/mix.sh
lib/curses/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block cmake_flags %}
-DBUILD_TESTING=OFF
-DCMAKE_USE_SYSTEM_EXPAT=ON
-DCMAKE_USE_SYSTEM_ZLIB=ON
-DCMAKE_USE_SYSTEM_LIBUV=ON
-DCMAKE_USE_SYSTEM_CURL=ON
-DCMAKE_USE_SYSTEM_BZIP2=ON
-DCMAKE_USE_SYSTEM_LIBLZMA=ON
-DCMAKE_USE_SYSTEM_LIBARCHIVE=ON
{% endblock %}
