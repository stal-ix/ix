{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/shaderc/archive/refs/tags/v2022.1.tar.gz
sha:592c0ba07706a940f95a24073d7f3d050daa0839f24019434a7b2776e5620ace
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
