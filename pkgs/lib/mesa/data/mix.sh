{% extends '//lib/mesa/nodrv/mix.sh' %}

{% block env %}
export MESA_DATA="${out}"
{% endblock %}
