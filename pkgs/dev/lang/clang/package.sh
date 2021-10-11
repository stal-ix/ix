{% extends '//mix/template/cmake.sh' %}

{% block deps %}
{% block extradeps %}
# bld {{'lib/linux' | linux}}
# bld {{'sys/framework/CoreFoundation' | darwin}}
# bld boot/final/cxx boot/final/env/clang
{% endblock %}
# run env/clang env/lld/{{mix.platform.target.os}} env/compiler env/system
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
