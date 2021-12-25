{% extends '//dev/build/ya/t/mix.sh' %}

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -O0"
{{super()}}
{% endblock %}

{% block build %}
cd ${ARC_ROOT}/junk/pg/boot

dash stage1.sh ${ARC_ROOT} ${tmp}/obj \
    ${ARC_ROOT}/devtools/ymake/bin/g1.json
{% endblock %}
