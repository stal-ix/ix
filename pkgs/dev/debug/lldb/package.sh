{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block deps %}
# bld {{'lib/linux/package.sh' | linux}}
# bld {{'sys/framework/CoreFoundation/package.py' | darwin}}
# bld lib/cxx/package.sh
# bld lib/curses/any/package.sh
# bld lib/edit/package.sh
# bld lib/xz/package.sh
# bld lib/xml2/package.sh
# bld dev/lang/python/3/10/lib/package.sh
# bld dev/build/cmake/package.sh
# bld dev/tool/swig/4/package.sh
# bld env/std/package.sh
{% endblock %}

{% block patch %}
>llvm/unittests/Support/DynamicLibrary/CMakeLists.txt
sed -e 's|libkind SHARED|libkind STATIC|' -i lldb/cmake/modules/AddLLDB.cmake
{% endblock %}

{% block cmflags %}
-DLLVM_BUILD_LLVM_DYLIB=OFF
-DLLVM_LINK_LLVM_DYLIB=OFF
-DLLVM_ENABLE_PROJECTS="clang;lldb"
-DCLANG_LINK_CLANG_DYLIB=OFF
-DLLVM_POLLY_LINK_INTO_TOOLS=ON
-DLLVM_ENABLE_PIC=OFF
-DLLVM_DYLIB_COMPONENTS=''
-DLLDB_ENABLE_LIBEDIT=ON
-DLLDB_ENABLE_CURSES=ON
-DLLDB_ENABLE_LZMA=ON
-DLLDB_ENABLE_LIBXML2=ON
-DLLDB_ENABLE_PYTHON=ON
../llvm
{% endblock %}

{% block build %}
cd build && ninja lldb
{% endblock %}

{% block postinstall %}
#cd ${out}

#mkdir new
#mv bin/lldb* new/
#rm -rf bin lib share include libexec
#mv new bin
{% endblock %}
