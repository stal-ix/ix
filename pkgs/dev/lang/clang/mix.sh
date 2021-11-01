{% extends '//mix/template/cmake.sh' %}

{% block deps %}
{% block extradeps %}
# bld {{'lib/linux/mix.sh' | linux}}
# bld {{'sys/framework/CoreFoundation/mix.sh' | darwin}}
# bld boot/final/cxx/mix.sh
# bld boot/final/env/clang/mix.sh
{% endblock %}
# run env/clang/mix.sh
# run env/lld/{{mix.platform.target.os}}/mix.sh
# run env/compiler/mix.sh
# run env/system/mix.sh
{% endblock %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block cflags %}
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
-DBUILD_SHARED_LIBS=OFF
{% block cmdir %}../llvm{% endblock %}
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
