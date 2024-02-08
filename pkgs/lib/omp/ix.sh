{% extends '//die/c/cmake.sh' %}

{% block fetch %}
{% include '//lib/llvm/latest/ver.sh' %}
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
OPENMP_STANDALONE_BUILD=ON
LLVM_ENABLE_RUNTIMES=openmp
OPENMP_ENABLE_LIBOMPTARGET=OFF
LIBOMP_HEADERS_INSTALL_PATH=${out}/include
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/*.a ${out}/lib/libompd.*
{% endblock %}
