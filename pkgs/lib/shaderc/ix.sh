{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/shaderc/archive/refs/tags/v2023.7.tar.gz
sha:681e1340726a0bf46bea7e31f10cbfe78e01e4446a35d90fedc2b78d400fcdeb
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
"2023.5\\n"
"2023.5\\n"
"2023.5\\n"
EOF
{% endblock %}

{% block install %}
{{super()}}
for x in ${out}/lib/pkgconfig/*.pc; do
    sed -e 's|//.*/lib|/lib|' -i ${x}
done
{% endblock %}
