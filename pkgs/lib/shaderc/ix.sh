{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/shaderc/archive/refs/tags/v2022.2.tar.gz
sha:517d36937c406858164673db696dc1d9c7be7ef0960fbf2965bfef768f46b8c0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glslang
lib/vulkan/spirv/tools
lib/vulkan/spirv/headers
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block cmake_flags %}
SHADERC_SKIP_TESTS=ON
SHADERC_SKIP_EXAMPLES=ON
SHADERC_ENABLE_INSTALL=ON
SHADERC_ENABLE_WERROR_COMPILE=OFF
{% endblock %}

{% block patch %}
sed '/examples/d;/third_party/d' -i CMakeLists.txt
sed '/build-version/d' -i glslc/CMakeLists.txt

cat <<- EOF > glslc/src/build-version.inc
"2022.1\\n"
"2022.1\\n"
"2022.1\\n"
EOF
{% endblock %}
