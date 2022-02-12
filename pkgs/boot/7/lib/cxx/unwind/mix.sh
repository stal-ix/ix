{% extends '//mix/c_std.sh' %}

{% block fetch %}
{% include '//lib/llvm/t/ver.sh' %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/6/env/std
{% endblock %}

{% block unpack %}
{{super()}}
cd libunwind
{% endblock %}

{% block cpp_defines %}
_LIBUNWIND_HAS_COMMENT_LIB_PRAGMA=1
_LIBUNWIND_IS_NATIVE_ONLY=1
_DEBUG=1
{% endblock %}

{% block setup %}
export CPPFLAGS="-w -I${PWD}/src -I${PWD}/include -funwind-tables ${CPPFLAGS}"
export CXXFLAGS="-std=c++11 -fstrict-aliasing -fno-exceptions -fno-rtti ${CXXFLAGS}"
export CONLYFLAGS="-std=c99 ${CFLAGS}"
{% endblock %}

{% block build %}
for s in src/*.cpp; do
    c++ -c ${s}
done

for s in src/*.c src/*.S; do
    cc -c ${s}
done

ar qs libunwind.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libunwind.a ${out}/lib
cp -R include ${out}/
{% endblock %}
