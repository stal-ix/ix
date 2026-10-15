{% extends '//die/c/ix.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/vulkan/utility
lib/spirv/tools
{% endblock %}

{% block bld_tool %}
bld/librarian
{% endblock %}

{% block bld_libs %}
lib/vulkan/validation
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp $(findlib libVkLayer_khronos_validation.a) ${out}/lib/libvvl.a
chmod +w ${out}/lib/libvvl.a
patchns ${out}/lib/libvvl.a vvl_
{% endblock %}
