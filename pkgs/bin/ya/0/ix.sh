{% extends '//bin/ya/t/ix.sh' %}

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -O0"
{{super()}}
{% endblock %}

{% block stage %}stage1.sh{% endblock %}
