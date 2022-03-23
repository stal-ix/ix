{% extends '//lib/mesa/t/sep/mix.sh' %}

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

{% block install %}
{{super()}}
rm ${out}/lib/libgldrivers.a
{% endblock %}

{% block merge_drivers %}
mv dri/*.so libgldrivers.a
{% endblock %}

{% block env_lib %}
export LDFLAGS="-L${out}/lib -lgbm -lglapi \${LDFLAGS}"
export COFLAGS="--with-gallium=${out} \${COFLAGS}"
{% endblock %}
