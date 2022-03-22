{% extends '//lib/mesa/t/mix.sh' %}

{% block env %}
export MESA_DATA="${out}"
{% endblock %}
