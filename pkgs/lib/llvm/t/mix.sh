{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block patch %}
echo > llvm/unittests/Support/DynamicLibrary/CMakeLists.txt
{% endblock %}

{% block setup %}
{% if target.os == 'darwin' %}
export LDFLAGS="-Wl,-w ${LDFLAGS}"
{% endif %}
{% endblock %}

{% block cmake_flags %}
LLVM_BUILD_LLVM_DYLIB=OFF
LLVM_LINK_LLVM_DYLIB=OFF
LLVM_POLLY_LINK_INTO_TOOLS=ON
LLVM_ENABLE_PIC=OFF
LLVM_DYLIB_COMPONENTS=
{% endblock %}
