{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
shaderc
{% endblock %}

{% block version %}
2025.3
{% endblock %}

{% block fetch %}
https://github.com/google/shaderc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a8e4a25e5c2686fd36981e527ed05e451fcfc226bddf350f4e76181371190937
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glslang
lib/spirv/tools
lib/spirv/headers
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
"{{self.version().strip()}}\\n"
"{{self.version().strip()}}\\n"
"{{self.version().strip()}}\\n"
EOF

sed -e 's|env python|env python3|' -i utils/add_copyright.py
{% endblock %}

{% block install %}
{{super()}}
for x in ${out}/lib/pkgconfig/*.pc; do
    sed -e 's|//.*/lib|/lib|' -i ${x}
done
{% endblock %}
