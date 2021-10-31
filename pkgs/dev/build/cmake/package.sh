{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/Kitware/CMake/releases/download/v3.20.2/cmake-3.20.2.tar.gz
# md5 cd0e7735f1e51f30ee3b0844390a464a
{% endblock %}

{% block more_deps %}
# lib env/cmake/package.py
{% endblock %}

{% block deps %}
# lib dev/build/samurai/package.sh
# bld {{'sys/framework/CoreFoundation/package.py' | darwin}}
# bld lib/z/package.sh
# bld lib/xz/package.sh
# bld lib/uv/package.sh
# bld lib/cxx/package.sh
# bld lib/curl/package.sh
# bld lib/bzip2/package.sh
# bld lib/expat/package.sh
# bld lib/archive/package.sh
# bld {{'lib/linux/package.sh' | linux}}
# bld env/std/package.sh
# bld boot/final/env/tools/package.sh
{% endblock %}

{% block cmflags %}
-Dfortran=OFF
-DBUILD_TESTING=OFF
-DCMAKE_USE_SYSTEM_CURL=ON
-DCMAKE_USE_SYSTEM_BZIP2=ON
-DCMAKE_USE_SYSTEM_LIBLZMA=ON
{% endblock %}
