{% extends '//mix/cmake.sh' %}

{% block patch %}
echo > llvm/unittests/Support/DynamicLibrary/CMakeLists.txt
{% endblock %}

{% block setup %}
{% if darwin %}
export LDFLAGS="-Wl,-w ${LDFLAGS}"
{% endif %}
{% endblock %}

{% block std_box %}
bld/python
{{super()}}
{% endblock %}

{% block cmake_flags %}
# no dylib
LLVM_BUILD_LLVM_DYLIB=OFF
LLVM_LINK_LLVM_DYLIB=OFF
LLVM_ENABLE_PIC=OFF
LLVM_DYLIB_COMPONENTS=

# only static
LLVM_POLLY_LINK_INTO_TOOLS=ON

# small
LLVM_INCLUDE_BENCHMARKS=OFF
LLVM_INCLUDE_EXAMPLES=OFF
LLVM_INCLUDE_TESTS=OFF

# low memory
LLVM_PARALLEL_LINK_JOBS=2
{% endblock %}
