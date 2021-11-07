{% extends '//mix/template/cmake.sh' %}

{% block bld_deps %}
{{'lib/linux/mix.sh' | linux}}
{{'sys/framework/CoreFoundation/mix.sh' | darwin}}
boot/final/cxx/mix.sh
boot/final/env/clang/mix.sh
{% endblock %}

{% block run_deps %}
env/clang/mix.sh
env/lld/{{mix.platform.target.os}}/mix.sh
env/compiler/mix.sh
env/system/mix.sh
{% endblock %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block setup %}
{% if mix.platform.target.os == 'darwin' %}
export LDFLAGS="-Wl,-w ${LDFLAGS}"
{% endif %}
{% endblock %}

{% block patch %}
echo > llvm/unittests/Support/DynamicLibrary/CMakeLists.txt
{% endblock %}

{% block cmflags %}
-DLLVM_BUILD_LLVM_DYLIB=OFF
-DLLVM_LINK_LLVM_DYLIB=OFF
-DLLVM_ENABLE_PROJECTS="clang;lld;polly"
-DCLANG_LINK_CLANG_DYLIB=OFF
-DLLVM_POLLY_LINK_INTO_TOOLS=ON
-DLLVM_ENABLE_PIC=OFF
-DLLVM_DYLIB_COMPONENTS=''
{% endblock %}

{% block cmdir %}
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
