{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/Kitware/CMake/releases/download/v3.20.2/cmake-3.20.2.tar.gz
# md5 cd0e7735f1e51f30ee3b0844390a464a
{% endblock %}

{% block lib_deps %}
dev/build/samurai/mix.sh
{% endblock %}

{% block bld_deps %}
{{'sys/framework/CoreFoundation/mix.sh' | darwin}}
{{'lib/linux/mix.sh' | linux}}
lib/z/mix.sh
lib/xz/mix.sh
lib/uv/mix.sh
lib/cxx/mix.sh
lib/curl/mix.sh
lib/bzip2/mix.sh
lib/expat/mix.sh
lib/archive/mix.sh
env/std/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}

{% block cmflags %}
-Dfortran=OFF
-DBUILD_TESTING=OFF
-DCMAKE_USE_SYSTEM_CURL=ON
-DCMAKE_USE_SYSTEM_BZIP2=ON
-DCMAKE_USE_SYSTEM_LIBLZMA=ON
{% endblock %}

{% block more_env %}
base64 -d << EOF
{% include 'cmake.sh/base64' %}
EOF
{% endblock %}
