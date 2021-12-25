{% extends '//dev/build/ya/t/mix.sh' %}

{% block bld_tool %}
{{super()}}

{% block ya_boot %}
dev/build/ya/0/mix.sh(arc_root={{arc_root}})
{% endblock %}
{% endblock %}

{% block build %}
cd ${ARC_ROOT}/junk/pg/boot
dash stage3.sh ${ARC_ROOT} ${tmp}/obj
{% endblock %}

{% block install %}
{{super()}}

rnd=$(python3 -c 'import random; print(random.random())')
mv ${tmp}/obj ${tmp}/../obj.${rnd}
{% endblock %}
