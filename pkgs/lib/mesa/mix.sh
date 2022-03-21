{% extends '//lib/mesa/nodrv/mix.sh' %}

{% block run_data %}
lib/mesa/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts
{% endblock %}

{% block configure %}
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
{{super()}}

cd src/gallium/frontends/dri

for l in *.c *.h; do
    for x in dri2_lookup_egl_image dri2_validate_egl_image; do
        sed -e "s|${x}|${x}_xxx|g" -i ${l}
    done
done
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
rm -r dri
>empty.c
cc -c empty.c
rm libGLESv1_CM.a
ar q libGLESv1_CM.a empty.o
{% endblock %}

{% block env_lib %}
export LDFLAGS="-L${out}/lib -lEGL -lgbm -lglapi \${LDFLAGS}"
export COFLAGS="--with-gallium=${out} \${COFLAGS}"
{% endblock %}

{% block no_lib_env %}
{% endblock %}
