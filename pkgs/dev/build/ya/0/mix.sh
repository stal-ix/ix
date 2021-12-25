{% extends '//dev/build/ya/t/mix.sh' %}

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -O0"
{{super()}}
{% endblock %}

{% block build %}
{{super()}}

dash stage1.sh ${ARC_ROOT} ${BLD_ROOT} \
    ${ARC_ROOT}/devtools/ymake/bin/g1.json
{% endblock %}
