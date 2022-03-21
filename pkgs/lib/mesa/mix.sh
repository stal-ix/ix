{% extends '//lib/mesa/t/nodrv/mix.sh' %}

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
export LDFLAGS="-L${out}/lib -lgbm -lglapi \${LDFLAGS}"
export COFLAGS="--with-gallium=${out} \${COFLAGS}"
{% endblock %}

{% block no_lib_env %}
{% endblock %}
