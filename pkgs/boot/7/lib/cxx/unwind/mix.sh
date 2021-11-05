{% extends '//mix/template/template.sh' %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-I./src -I./include -D_LIBUNWIND_HAS_COMMENT_LIB_PRAGMA -funwind-tables -D_DEBUG -D_LIBUNWIND_IS_NATIVE_ONLY ${CPPFLAGS}"
export CXXFLAGS="-std=c++11 -fstrict-aliasing -fno-exceptions -fno-rtti ${CXXFLAGS}"
export CFLAGS="-std=c99 ${CFLAGS}"
{% endblock %}

{% block postunpack %}
cd libunwind
{% endblock %}

{% block build %}
for s in src/*.cpp; do
    g++ -c $s
done

for s in src/*.c src/*.S; do
    gcc -c $s
done

ar q libunwind.a *.o
ranlib libunwind.a
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libunwind.a ${out}/lib
cp -R include ${out}/
{% endblock %}
