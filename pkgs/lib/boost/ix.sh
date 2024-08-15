{% extends '//die/c/ix.sh' %}

{#
: && /ix/build/T3kvwPusLKM6b72u/bin/tc/clang++ -O3 -DNDEBUG  CMakeFiles/cppgir.dir/tools/cppgir.cpp.o CMakeFiles/cppgir.dir/tools/genbase.cpp.o CMakeFiles/cppgir.dir/tools/genns.cpp.o CMakeFiles/cppgir.dir/tools/genutils.cpp.o CMakeFiles/cppgir.dir/tools/function.cpp.o CMakeFiles/cppgir.dir/tools/repository.cpp.o -o cppgir  /ix/store/F1FHzElAD4TdInUR-lib-fmt-9/lib/libfmt.a && :
ld.lld: error: duplicate symbol: __cxa_allocate_exception
>>> defined at from_exception.cpp
>>>            from_exception.o:(__cxa_allocate_exception) in archive /ix/store/5rV34zMi8lZaI4ic-lib-boost/lib/libboost_stacktrace_from_exception.a
>>> defined at cxa_exception.cpp
>>>            cxa_exception.cpp.o:(.text.__cxa_allocate_exception+0x0) in archive /ix/store/0s9LqOSQkwkvgwid-lib-c-plus-plus-18/lib/libc++abi.a
clang++: error: linker command failed with exit code 1 (use -v to see invocation)
#}

{% block fetch %}
https://boostorg.jfrog.io/artifactory/main/release/1.85.0/source/boost_1_85_0.tar.bz2
sha:7009fe1faa1697476bdc7027703a2badb84e849b7b0baad5086b087b971f8617
{% endblock %}

{% block bld_tool %}
bld/b2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block configure %}
sh bootstrap.sh --prefix=${out} \
    --with-bjam=$(which b2) \
    --without-icu \
    --without-libraries=python \
    --with-toolset=clang
{% endblock %}

{% block build %}
b2 link=static
{% endblock %}

{% block install %}
b2 link=static install
sed -e 's|len + 1}|int(len + 1)}|' -i ${out}/include/boost/process/detail/posix/executor.hpp
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|::mode_t|int|' -i boost/interprocess/permissions.hpp
{% endblock %}

{% block env %}
export COFLAGS="--with-boost=${out} \${COFLAGS}"
{% endblock %}
