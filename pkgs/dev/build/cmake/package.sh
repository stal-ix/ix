{% extends '//util/cmake.sh' %}

{% block fetch %}
# url https://github.com/Kitware/CMake/releases/download/v3.20.2/cmake-3.20.2.tar.gz
# md5 cd0e7735f1e51f30ee3b0844390a464a
{% endblock %}

{% block run_deps %}
env/cmake
{% endblock %}

{% block deps %}
# lib dev/build/samurai
# bld lib/z lib/xz lib/uv lib/cxx lib/curl lib/bzip2
# bld lib/expat lib/archive {{mix.if_linux('lib/linux')}}
# bld env/std boot/final/env/tools
{% endblock %}

{% block cmflags %}
-Dfortran=OFF
-DBUILD_TESTING=OFF
-DCMAKE_USE_SYSTEM_CURL=ON
-DCMAKE_USE_SYSTEM_BZIP2=ON
-DCMAKE_USE_SYSTEM_LIBLZMA=ON
..
{% endblock %}
