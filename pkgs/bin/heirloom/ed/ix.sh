{% extends '//bin/heirloom/t/ix.sh' %}

{% block heirloom_tools %}ed{% endblock %}

{% block setup_target_flags %}
{{super()}}
export CFLAGS="${CFLAGS} -O0"
export OPTFLAGS="${OPTFLAGS} -O0"
{% endblock %}
