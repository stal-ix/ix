{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/Kitware/CMake/releases/download/v3.20.2/cmake-3.20.2.tar.gz
# md5 cd0e7735f1e51f30ee3b0844390a464a
{% endblock %}

{% block more_deps %}
# lib env/cmake/package.py
{% endblock %}

{% block deps %}
# lib dev/build/samurai/mix.sh
# bld {{'sys/framework/CoreFoundation/package.py' | darwin}}
# bld lib/z/mix.sh
# bld lib/xz/mix.sh
# bld lib/uv/mix.sh
# bld lib/cxx/mix.sh
# bld lib/curl/mix.sh
# bld lib/bzip2/mix.sh
# bld lib/expat/mix.sh
# bld lib/archive/mix.sh
# bld {{'lib/linux/mix.sh' | linux}}
# bld env/std/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block cmflags %}
-Dfortran=OFF
-DBUILD_TESTING=OFF
-DCMAKE_USE_SYSTEM_CURL=ON
-DCMAKE_USE_SYSTEM_BZIP2=ON
-DCMAKE_USE_SYSTEM_LIBLZMA=ON
{% endblock %}
