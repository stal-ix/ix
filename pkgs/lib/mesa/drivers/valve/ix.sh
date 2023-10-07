{% extends '//lib/mesa/t/ix.sh' %}

{% block lib_deps %}
lib/elfutils
{{super()}}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/librarian
bld/wrapcc/ar
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
vkCmdBindPipeline
vkCmdDispatch
vkCmdDispatchIndirect
vkCmdFillBuffer
vkCmdPipelineBarrier
vkCmdPushConstants
vkCreateComputePipelines
vkCreatePipelineLayout
vkCreateShaderModule
vkDestroyPipeline
vkDestroyPipelineLayout
vkDestroyShaderModule
vkGetBufferDeviceAddress
{% endblock %}

{% block meson_flags %}
{{super()}}
vulkan-drivers={{vulkan}}
gallium-drivers={{','.join((opengl or '').split('|'))}}
{% endblock %}

{% block setup_tools %}
cat << EOF > ${AR}
#!/usr/bin/env sh
exec wrapar "$(command -v ${AR})" "\${@}"
EOF
chmod +x ${AR}
{{super()}}
{% endblock %}

{% block patch %}
(
{{super()}}
)

(
cd src/gallium/frontends/dri

for l in *.c *.h; do
    for x in dri2_lookup_egl_image dri2_lookup_egl_image_validated dri2_validate_egl_image; do
        sed -e "s|${x}|${x}_xxx|g" -i ${l}
    done
done
)

(
cd src/gallium/drivers/radeonsi

for l in *.c *.h *.cpp; do
    for x in vi_alpha_is_on_msb si_emit_cache_flush si_cp_dma_prefetch si_cp_dma_clear_buffer si_cp_dma_wait_for_idle; do
        sed -e "s|${x}|${x}_xxx|g" -i ${l}
    done
done
)
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

mv dri/*.so libgallium.a
patchns libgallium.a o_

{% if vulkan %}
patchns libvulkan_* v_
llvm-ar qL libgldrivers.a libgallium* libvulkan_*
llvm-objcopy \
    --redefine-sym "vk_format_get_ycbcr_info=v_vk_format_get_ycbcr_info" \
    --redefine-sym "vk_format_to_pipe_format=v_vk_format_to_pipe_format" \
    libgldrivers.a
{% else %}
mv libgallium.a libgldrivers.a
{% endif %}

# some sanity checks
llvm-nm libgldrivers.a | grep ' T ' | sort | uniq -c | grep -v ' 1 ' | while read l; do
    echo 'broken libgldrivers.a'
    exit 1
done

cd ${out}

mv lib tmp
mkdir lib
mv tmp/libgldrivers.a lib/
rm -r tmp
{% endblock %}

{% block skip_auto_lib_env %}
{% endblock %}

{% block cpp_defines %}
{{super()}}
VK_COMPONENT_TYPE_MAX_ENUM_NV=VK_COMPONENT_TYPE_MAX_ENUM_KHR
VK_SCOPE_MAX_ENUM_NV=VK_SCOPE_MAX_ENUM_KHR
{% endblock %}

{% block env %}
export LDFLAGS="-L${out}/lib -Wl,--whole-archive -lgldrivers -Wl,--no-whole-archive \${LDFLAGS}"
{% endblock %}
