{% extends '//mix/template/cmake.sh' %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreFoundation/mix.sh
{% endif %}
boot/final/cxx/mix.sh
{% endblock %}

{% block std_env %}
boot/final/env/clang/mix.sh
{% endblock %}

{% block ind_deps %}
env/toolchain/mix.sh
env/release/mix.sh
{% endblock %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block setup %}
{% if target.os == 'darwin' %}
export LDFLAGS="-Wl,-w ${LDFLAGS}"
{% endif %}
{% endblock %}

{% block patch %}
echo > llvm/unittests/Support/DynamicLibrary/CMakeLists.txt
{% endblock %}

{% block cmake_flags %}
-DLLVM_BUILD_LLVM_DYLIB=OFF
-DLLVM_LINK_LLVM_DYLIB=OFF
-DLLVM_ENABLE_PROJECTS="clang;lld;polly"
-DCLANG_LINK_CLANG_DYLIB=OFF
-DLLVM_POLLY_LINK_INTO_TOOLS=ON
-DLLVM_ENABLE_PIC=OFF
-DLLVM_DYLIB_COMPONENTS=''
{% endblock %}

{% block cmake_srcdir %}
llvm
{% endblock %}

{% block postinstall %}
python3 << EOF
{% include 'strip.py' %}
EOF
{% endblock %}

{% block env %}
export CLANG_VERSION=13.0.0
export CPPFLAGS="-isystem ${out}/lib/clang/\$CLANG_VERSION/include \${CPPFLAGS}"
{% endblock %}
