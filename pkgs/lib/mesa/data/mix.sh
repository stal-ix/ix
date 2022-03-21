{% extends '//lib/mesa/t/nodrv/mix.sh' %}

{% block env %}
export MESA_DATA="${out}"
{% endblock %}
