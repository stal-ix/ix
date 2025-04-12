{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
shaderc
{% endblock %}

{% block version %}v2025.1{% endblock %}

{% block fetch %}
https://github.com/google/shaderc/archive/refs/tags/{{self.version()}}.tar.gz
sha:d5c68b5de5d4c7859d9699054493e0a42a2a5eb21b425d63f7b7dd543db0d708
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
