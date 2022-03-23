{% extends '//lib/mesa/t/sep/mix.sh' %}

{% block mesa_drivers %}
dri-drivers=
vulkan-drivers={{vulkan}}
gallium-drivers={{opengl}}
{% endblock %}

{% block patch %}
(
{{super()}}
)

cd src/gallium/frontends/dri

for l in *.c *.h; do
    for x in dri2_lookup_egl_image dri2_lookup_egl_image_validated dri2_validate_egl_image; do
        sed -e "s|${x}|${x}_xxx|g" -i ${l}
    done
done
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv lib tmp
mkdir lib
mv tmp/libgldrivers.a lib/
rm -r tmp
{% endblock %}

{% block env_lib %}
export LDFLAGS="-L${out}/lib -Wl,--whole-archive -lgldrivers -Wl,--no-whole-archive \${LDFLAGS}"
{% endblock %}
