{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/releases/download/v3.21.4/cmake-3.21.4.tar.gz
9d399e7a5032ef8cbe8eb23aad17e3c6
{% endblock %}

{% block bld_deps %}
{{'sys/framework/CoreFoundation/mix.sh' | darwin}}
{{'lib/linux/mix.sh' | linux}}
lib/z/mix.sh
lib/xz/mix.sh
lib/uv/mix.sh
lib/c++/mix.sh
lib/curl/mix.sh
lib/bzip2/mix.sh
lib/expat/mix.sh
lib/archive/mix.sh
lib/curses/mix.sh
boot/final/env/tools/mix.sh
env/std/mix.sh
{% endblock %}

{% block cmflags %}
-DBUILD_TESTING=OFF
-DCMAKE_USE_SYSTEM_CURL=ON
-DCMAKE_USE_SYSTEM_BZIP2=ON
-DCMAKE_USE_SYSTEM_LIBLZMA=ON
{% endblock %}
