{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreFoundation/mix.sh
{% endif %}
lib/c/mix.sh
lib/c++/mix.sh
lib/curses/mix.sh
lib/edit/mix.sh
lib/xz/mix.sh
lib/xml2/mix.sh
lib/python/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/swig/4/mix.sh
{% endblock %}

{% block patch %}
>llvm/unittests/Support/DynamicLibrary/CMakeLists.txt
sed -e 's|libkind SHARED|libkind STATIC|' -i lldb/cmake/modules/AddLLDB.cmake
{% endblock %}

{% block cmake_flags %}
LLVM_BUILD_LLVM_DYLIB=OFF
LLVM_LINK_LLVM_DYLIB=OFF
LLVM_ENABLE_PROJECTS="clang;lldb"
CLANG_LINK_CLANG_DYLIB=OFF
LLVM_POLLY_LINK_INTO_TOOLS=ON
LLVM_ENABLE_PIC=OFF
LLVM_DYLIB_COMPONENTS=''
LLDB_ENABLE_LIBEDIT=ON
LLDB_ENABLE_CURSES=ON
LLDB_ENABLE_LZMA=ON
LLDB_ENABLE_LIBXML2=ON
LLDB_ENABLE_PYTHON=ON
{% endblock %}

{% block cmake_srcdir %}
llvm
{% endblock %}

{% block build %}
cd build && ninja lldb
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

mkdir new
mv bin/lldb* new/
rm -rf bin lib share include libexec
mv new bin
{% endblock %}
