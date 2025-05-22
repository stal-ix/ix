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
lib/spirv/tools
lib/spirv/llvm/translator
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
src/compiler/clc/mesa_clc
src/compiler/spirv/vtn_bindgen2
{% endblock %}

{% block meson_flags %}
gallium-drivers=
vulkan-drivers=
platforms=
tools=
install-mesa-clc=true
mesa-clc=enabled
intel-bvh-grl=true
install-intel-clc=true
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
cp ${tmp}/obj/src/intel/compiler/intel_clc ${out}/bin/
cp ${tmp}/obj/src/compiler/clc/mesa_clc ${out}/bin/
cp ${tmp}/obj/src/compiler/spirv/vtn_bindgen2 ${out}/bin/
{% endblock %}
