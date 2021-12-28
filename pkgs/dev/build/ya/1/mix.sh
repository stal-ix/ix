{% extends '//dev/build/ya/t/mix.sh' %}

{% block bld_tool %}
{{super()}}
{% block ya_boot %}
dev/build/ya/0(arc_root={{arc_root}},ya_ver={{ya_ver}})
{% endblock %}
{% endblock %}

{% block stage %}stage3.sh{% endblock %}

{% block setup %}
{{super()}}
export YA_PREFETCH_DIR=${BLD_ROOT}
{% endblock %}

{% block configure %}
{{super()}}

mkdir ${BLD_ROOT}/bin

ln -s $(which python2) ${BLD_ROOT}/python
ln -s $(which java) ${BLD_ROOT}/bin/
{% endblock %}

{% block install %}
{{super()}}
rnd=$(python3 -c 'import random; print(random.random())')
mv ${BLD_ROOT} ${tmp}/../obj.${rnd}
{% endblock %}
