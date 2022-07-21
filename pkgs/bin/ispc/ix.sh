{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ispc/ispc/archive/refs/tags/v1.18.0.tar.gz
sha:81f2cc23b555c815faf53429e9eee37d1f2f16873ae7074e382ede94721ee042
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/llvm
lib/curses
lib/intel/tbb
{% endblock %}

{% block bld_tool %}
bld/m4
bld/flex
bld/bison
bld/python
{% endblock %}

{% block cmake_flags %}
ISPC_INCLUDE_EXAMPLES=OFF
ISPC_INCLUDE_UTILS=OFF
ISPC_INCLUDE_TESTS=OFF
ISPCRT_BUILD_TASK_MODELS="TBB;Threads"
ISPCRT_BUILD_TASK_MODEL=TBB
{% endblock %}

{% block cmake_extra_flags %}
-DLLVM_CONFIG_EXECUTABLE=$(which llvm-config)
-DCLANG_EXECUTABLE=$(which clang)
-DCLANGPP_EXECUTABLE=$(which clang++)
-DLLVM_AS_EXECUTABLE=$(which llvm-as)
-DLLVM_DIS_EXECUTABLE=$(which llvm-dis)
{% endblock %}

{% block setup_tools %}
cat << EOF > llvm-config
#!/usr/bin/env sh

case "\${1}" in
    --version)
        echo "14.0.6"
        exit 0
    ;;
esac
EOF

chmod +x llvm-config
{% endblock %}
