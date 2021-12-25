{% extends '//dev/build/ya/t/mix.sh' %}

{% block bld_tool %}
{{super()}}

{% block ya_boot %}
dev/build/ya/0/mix.sh(arc_root={{arc_root}})
{% endblock %}
{% endblock %}

{% block build %}
{{super()}}

dash stage3.sh ${ARC_ROOT} ${BLD_ROOT}
{% endblock %}

{% block install %}
{{super()}}

rnd=$(python3 -c 'import random; print(random.random())')
mv ${BLD_ROOT} ${tmp}/../obj.${rnd}
{% endblock %}
