{% extends '//util/template.sh' %}

{% block fetch %}
{% include '//util/fetch_llvm.sh' %}
{% endblock %}

{% block deps %}
# bld boot/stage/5/env
{% endblock %}

{% block cflags %}
export CPPFLAGS="-I./src -I./include -D_LIBUNWIND_HAS_COMMENT_LIB_PRAGMA -funwind-tables -D_DEBUG -D_LIBUNWIND_IS_NATIVE_ONLY ${CPPFLAGS}"
export CXXFLAGS="-std=c++11 -fstrict-aliasing -fno-exceptions -fno-rtti ${CXXFLAGS}"
export CFLAGS="-std=c99 ${CFLAGS}"
{% endblock %}

{% block build %}
for s in src/*.cpp; do
    g++ ${CPPFLAGS} ${CFLAGS} ${CXXFLAGS} -c $s
done

for s in src/*.c src/*.S; do
    gcc ${CPPFLAGS} ${CFLAGS} -c $s
done

ar q libunwind.a *.o
ranlib libunwind.a
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp obj/libunwind.a ${out}/lib
cp -R include ${out}/
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="${out}/lib/libunwind.a \${LDFLAGS}"
{% endblock %}
