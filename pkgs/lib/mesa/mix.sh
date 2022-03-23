{% extends '//lib/mesa/t/mix.sh' %}

{% block run_data %}
lib/mesa/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts
{% endblock %}

{% block configure %}
#export CMAKE_PREFIX_PATH="${lib_llvm}"
{{super()}}
python3 $(which fix_data_dir.py) ${MESA_DATA}
{% endblock %}

{% block c_rename_symbol %}
SHA1Pad
SHA1Init
SHA1Final
SHA1Update
SHA1Transform
handle_table_remove
os_create_anonymous_file
{% endblock %}

{% block patch %}
pushd src/gallium/frontends/dri

for l in *.c *.h; do
    for x in dri2_lookup_egl_image dri2_validate_egl_image; do
        sed -e "s|${x}|${x}_xxx|g" -i ${l}
    done
done

popd; pushd src/gallium/drivers/radeonsi

for l in *.c *.h *.cpp; do
    for x in vi_alpha_is_on_msb si_emit_cache_flush si_cp_dma_prefetch si_cp_dma_clear_buffer si_cp_dma_wait_for_idle; do
        sed -e "s|${x}|${x}_xxx|g" -i ${l}
    done
done
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

base64 -d << EOF > substr.py
{% include 'substr.py/base64' %}
EOF

mv dri/zink_dri.so libgallium.a
rm -r dri

python3 substr.py libvulkan* libgallium.a
llvm-ar qL libgldrivers.a libgallium* libvulkan_*
rm libgallium* libvulkan_*

python3 substr.py libgbm.a libEGL.a
python3 substr.py libgbm.a libgldrivers.a
python3 substr.py libEGL.a libgldrivers.a

rm substr.py

find . -type f -name '*.pc' | while read l; do
    sed -e 's|glesv1_cm,||g' -i ${l}
done
{% endblock %}

{% block env_lib %}
export LDFLAGS="-L${out}/lib -lgbm -lglapi \${LDFLAGS}"
export COFLAGS="--with-gallium=${out} \${COFLAGS}"
{% endblock %}

{% block skip_auto_lib_env %}
{% endblock %}
