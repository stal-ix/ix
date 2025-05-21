{% extends '//bin/chromium/unwrap/ix.sh' %}

{% block ninja_build_targets %}
libGLESv2.so
libEGL.so
{% endblock %}

{% block bld_tool %}
bin/wayland/scanner
bld/wrapcc/link/exe/host
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/lib
llvm-ar qL ${out}/lib/libangle.a ${tmp}/lib/libGLESv2.a ${tmp}/lib/libEGL.a
{% endblock %}

{% block gn_args %}
{{super()}}
angle_enable_d3d9=false
angle_enable_d3d11=false
angle_enable_gl=false
angle_enable_metal=false
angle_enable_null=false
angle_enable_vulkan=true
angle_enable_essl=false
angle_enable_glsl=false
{% endblock %}

{% block env %}
export ANGLE_DIR=${out}/lib
{% endblock %}

{% block patch %}
{{super()}}
find third_party/wayland/src -type f -name '*.c' | while read l; do
    echo > ${l}
done
sed -e 's|directory + libraryName|libraryName|' \
    -i third_party/angle/src/common/system_utils_posix.cpp
{% endblock %}

{% block c_rename_symbol %}
{% endblock %}
