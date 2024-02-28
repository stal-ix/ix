{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://mesa.freedesktop.org/archive/mesa-24.0.2.tar.xz
sha:94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/drm
lib/expat
lib/wayland
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_libs %}
pip/Mako
lib/mesa/fakes
{% endblock %}

{% block bld_tool %}
bld/make
bld/flex
bld/bison
bin/glslang
bld/wayland
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
handle_table_remove
{% endblock %}

{% block meson_flags %}
valgrind=disabled
libunwind=disabled
platforms=wayland
egl-native-platform=wayland
egl=enabled
glx=disabled
gles2=enabled
opengl=true
gallium-nine=false
cpp_rtti=false
shader-cache=disabled
llvm=disabled
shared-llvm=disabled
lmsensors=disabled
{% endblock %}

{% block patch %}
cat << EOF > merge.py
{% include 'merge.py' %}
EOF

python3 ./merge.py src/util/00-mesa-defaults.conf src/util/00-radv-defaults.conf > _
mv _ src/util/00-mesa-defaults.conf

cat << EOF >> src/util/xmlconfig.h
#undef WITH_XMLCONFIG
#define WITH_XMLCONFIG 0
EOF

cat << EOF > bin/install_megadrivers.py
#!$(which sh)
EOF

chmod +x bin/install_megadrivers.py

sed -e 's|with_dri = .*|with_dri = true|'         \
    -e 's|with_any_vk = .*|with_any_vk = true|'   \
    -e 's|with_gallium = .*|with_gallium = true|' \
    -i meson.build

sed -e 's|disk_cache_get_function_timestamp|disk_cache_get_function_timestamp_xxx|' \
    -e 's|disk_cache_get_function_identifier|disk_cache_get_function_identifier_xxx|' \
    -i src/util/disk_cache.h

cat << EOF >> src/util/disk_cache.h
#pragma once

static inline bool disk_cache_get_function_timestamp(void* ptr, uint32_t* timestamp) {
    *timestamp = 0;
    return true;
}

static inline bool disk_cache_get_function_identifier(void* ptr, struct mesa_sha1* ctx) {
    _mesa_sha1_update(ctx, &ptr, sizeof(ptr));

    return true;
}
EOF
{% endblock %}
