{% extends '//die/c/meson.sh' %}

{% block fetch %}
{% include '//lib/mesa/t/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/clc
lib/kernel
lib/llvm/19
bin/llvm/spirv
lib/vulkan/spirv/tools
{% endblock %}

{% block bld_tool %}
pip/Mako
bld/flex
bld/bison
pip/PyYAML
bld/llvm/config
bld/spirv/tools
{% endblock %}

{% block ninja_build_targets %}
src/intel/compiler/intel_clc
{% endblock %}

{% block meson_flags %}
dri3=disabled
gallium-drivers=
vulkan-drivers=
platforms=
tools=
intel-clc=enabled
video-codecs=
xmlconfig=disabled
llvm=enabled
shared-llvm=disabled
cpp_rtti=false
shader-cache=disabled
intel-rt=disabled
{% endblock %}

{% block meson_cross %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/src/intel/compiler/intel_clc ${out}/bin
{% endblock %}
