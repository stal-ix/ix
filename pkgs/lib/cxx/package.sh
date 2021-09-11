{% extends '//util/template.sh' %}

{% block deps %}
# dep lib/linux
# dep env/c boot/final/env
{% endblock %}

{% block fetch%}
{% include '//util/fetch_llvm.sh' %}
{% endblock %}

{% block cflags %}
export CPPFLAGS="-DNDEBUG -U__SSE2__ -I$out/include/c++/v1 $CPPFLAGS"
{% endblock %}

{% block build %}
build_cmake_ninja -DLIBUNWIND_ENABLE_SHARED=NO -DLIBUNWIND_ENABLE_STATIC=YES ../libunwind
export LIBS="$out/lib/libunwind.a $LIBS"

build_cmake_ninja -DLIBCXX_ENABLE_SHARED=NO -DLIBCXX_ENABLE_STATIC=YES -DLIBCXX_CXX_ABI=libcxxabi -DLIBCXX_USE_COMPILER_RT=yes -DLIBCXX_HAS_MUSL_LIBC=yes ../libcxx
export LIBS="$out/lib/libc++.a $LIBS"

build_cmake_ninja -DLIBCXXABI_ENABLE_SHARED=NO -DLIBCXXABI_ENABLE_STATIC=YES -DLIBCXXABI_LIBCXX_INCLUDES="$out/include/c++/v1" ../libcxxabi
export LIBS="$out/lib/libc++abi.a $LIBS"
{% endblock %}

{% block env %}
export CPPFLAGS="-I$out/include/c++/v1 \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lunwind -lc++abi -lc++ \$LDFLAGS"
{% endblock %}
