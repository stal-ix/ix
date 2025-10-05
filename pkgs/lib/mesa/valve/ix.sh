{% extends '//lib/mesa/base/ix.sh' %}

{% block lib_deps %}
lib/elfutils
{{super()}}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/librarian
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
amd-use-llvm=false
vulkan-drivers={{vulkan}}
gallium-drivers={{opengl}}
{% endblock %}

{% block c_flags %}
{{super()}}
-Wno-missing-prototypes
{% endblock %}

{% block install %}
{{super()}}
{% if vulkan %}
llvm-ar qL ${out}/lib/libgldrivers.a ${out}/lib/libgallium* ${out}/lib/libvulkan* ${out}/lib/gbm/*
rm ${out}/lib/libgallium* ${out}/lib/libvulkan*
rm -rf ${out}/lib/gbm
{% else %}
mv ${out}/lib/libgallium* ${out}/lib/libgldrivers.a
{% endif %}
rm ${out}/lib/libGLESv1_CM.a
patchns ${out}/lib/libEGL.a mesa_egl_
mv ${out}/lib/libEGL.a ${out}/lib/libmesa_EGL.a
patchns ${out}/lib/libGLESv2.a mesa_glesv2_
mv ${out}/lib/libGLESv2.a ${out}/lib/libmesa_GLESv2.a
patchns ${out}/lib/libgbm.a mesa_gbm_
mv ${out}/lib/libgbm.a ${out}/lib/libmesa_gbm.a
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
