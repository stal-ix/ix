{% extends '//mix/hub.sh' %}

{% block run_deps %}
{% if linux %}
#bld/mold
{% endif %}
{% endblock %}
