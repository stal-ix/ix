{% extends '//die/c/cmake.sh' %}

{# hard glibc and dynlib deps #}

{% block fetch %}
https://github.com/rr-debugger/rr/archive/refs/tags/5.7.0.tar.gz
sha:f7affaaee7316effd3f0924c94bc452ef50d372b94470cafe8568efd88451447
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
lib/capnproto
{% endblock %}

{% block bld_tool %}
bin/capnc
bld/python
{% endblock %}

{% block cmake_flags %}
staticlibs=ON
disable32bit=ON
WILL_RUN_TESTS=OFF
BUILD_TESTS=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
>src/preload/tweak_librrpage.py
sed -e 's|-fno-integrated-as||' -i CMakeLists.txt
{% endblock %}
