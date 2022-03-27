{% extends '//lib/mesa/t/sep/mix.sh' %}

{% block run_data %}
lib/mesa/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${MESA_DATA}"
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
