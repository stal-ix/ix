{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
MoltenVK
{% endblock %}

{% block version %}
1.4.2
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/MoltenVK/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6864db532f1dbbdb621a8d0ec13f24edae318fd9269dd3dd0cdff791334bb1cb
{% endblock %}

{% block patch %}
patch -p1 <<'EOF'
{% include 'unbundle.patch' %}
EOF
{% endblock %}

{% block lib_deps %}
lib/c++
lib/cereal
lib/spirv/cross
lib/spirv/headers
lib/spirv/tools
lib/vulkan/headers
lib/darwin/framework/AppKit
lib/darwin/framework/CoreFoundation
lib/darwin/framework/CoreGraphics
lib/darwin/framework/Foundation
lib/darwin/framework/IOKit
lib/darwin/framework/IOSurface
lib/darwin/framework/Metal
lib/darwin/framework/QuartzCore
{% endblock %}

{% block bld_tool %}
bld/git
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export OBJC=${CC}
export OBJCXX=${CXX}
{% endblock %}

{% block cmake_flags %}
MVK_BUILD_SHADER_CONVERTER_TOOL=OFF
CMAKE_OSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET}
CMAKE_OSX_SYSROOT=${OSX_SDK}
{% endblock %}

{% block cmake_extra_flags %}
-DCMAKE_OBJC_COMPILER="$(which ${OBJC})"
-DCMAKE_OBJCXX_COMPILER="$(which ${OBJCXX})"
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/include/MoltenVK
cp MoltenVK/MoltenVK/API/*.h ${out}/include/MoltenVK/
{% endblock %}
