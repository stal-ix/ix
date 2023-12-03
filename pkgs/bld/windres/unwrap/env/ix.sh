{% extends '//die/env.sh' %}

{% block env %}
export WINDRES={{bin_prefix}}windres
{% endblock %}
