{% extends '//lib/mesa/t/mix.sh' %}

{% block meson_flags%}
{{super()}}
dri-drivers=
vulkan-drivers=amd
gallium-drivers=zink
{% endblock %}

{% block c_rename_symbol %}
dri2_validate_egl_image
dri2_lookup_egl_image_validated
dri2_lookup_egl_image

handle_table_remove

vi_alpha_is_on_msb
si_emit_cache_flush
si_cp_dma_prefetch
si_cp_dma_clear_buffer
si_cp_dma_wait_for_idle
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

rm -rf include share

mkdir tmp

mv lib/libvulkan_*.a tmp/
mv lib/dri/*.so tmp/libgallium.a

cd tmp

cat << EOF > ${tmp}/fix.py
import os
import sys

def rn(fr, to):
    if fr != to:
        print(f'rename {fr} {to}')
        os.rename(fr, to)

n = sys.argv[1].replace('/', '_').replace('.', '_')

for x in list(os.listdir('.')):
    print(f'got {x}')
    rn(x, x[:-2].replace('.', '_') + x[-2:])

for x in list(os.listdir('.')):
    if x.startswith('___'):
        rn(x, 'Z' + n + x)
EOF

for l in *.a; do
    llvm-ar x ${l}
    python3 ${tmp}/fix.py ${l}
done

rm si_state_draw* && for i in 1 2 3 4 5 6; do
    llvm-ar -xN ${i} libgallium.a si_state_draw.cpp.o
    mv si_state_draw.cpp.o si_state_draw_cpp_${i}.o
done

rm meson*vulkan_util*
rm *egl_wayland_wayland-drm_linux-dmabuf-unstable-v1-protocol*
rm *libvulkan_radeon_a___spirv_*

${AR} q libfullgl.a *.o

cd ..

rm -r lib
mkdir lib
mv tmp/libfullgl.a lib/
rm -r tmp
{% endblock %}

{% block env_lib %}
export LDFLAGS="-L${out}/lib -Wl,--whole-archive -lfullgl -Wl,--no-whole-archive \${LDFLAGS}"
{% endblock %}

{% block no_lib_env %}
{% endblock %}
