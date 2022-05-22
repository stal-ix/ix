{% extends '//die/cmake.sh' %}

{% block fetch %}
{% include '//lib/llvm/14/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/perl
bld/python
{% endblock %}

{% block cmake_srcdir %}
runtimes
{% endblock %}

{% block cmake_flags %}
ENABLE_OMPT_TOOLS=OFF
OPENMP_ENABLE_LIBOMPTARGET=OFF
LLVM_ENABLE_RUNTIMES=openmp
LIBOMP_HEADERS_INSTALL_PATH=${out}/include
{% endblock %}

{% block patch %}
sed -e 's|.*REGEX.*MATCH.*CLANG_VERSION.*|set(CLANG_VERSION 14.0.1)|' \
    -e 's|.*set.*LIBOMP_HEADERS_INSTALL_PATH.*||' \
    -i openmp/runtime/src/CMakeLists.txt
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

rm *.a

cp libomp.so libomp.a
cp libompd.so libompd.a
cp libarcher.so libarcher.a
{% endblock %}
