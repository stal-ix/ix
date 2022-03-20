{% extends '//lib/alsa/t/mix.sh' %}

{% block env %}
export ALSA_LIB_DATA="${out}"
{% endblock %}
