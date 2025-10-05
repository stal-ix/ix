{% extends '//lib/mesa/base/ix.sh' %}

{% block lib_deps %}
lib/elfutils
{{super()}}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/librarian
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
