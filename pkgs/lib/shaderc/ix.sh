{% extends '//die/c/cmake.sh' %}

{% block version %}v2024.1{% endblock %}

{% block fetch %}
https://github.com/google/shaderc/archive/refs/tags/{{self.version()}}.tar.gz
sha:eb3b5f0c16313d34f208d90c2fa1e588a23283eed63b101edd5422be6165d528
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
"{{self.version()}}\\n"
"{{self.version()}}\\n"
"{{self.version()}}\\n"
EOF

sed -e 's|env python|env python3|' -i utils/add_copyright.py
{% endblock %}

{% block install %}
{{super()}}
for x in ${out}/lib/pkgconfig/*.pc; do
    sed -e 's|//.*/lib|/lib|' -i ${x}
done
{% endblock %}
