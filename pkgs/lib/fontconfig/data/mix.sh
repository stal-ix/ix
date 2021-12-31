{% extends '//lib/fontconfig/t/mix.sh' %}

{% block env %}
export FONTCONFIG_DATA="${out}"
{% endblock %}
