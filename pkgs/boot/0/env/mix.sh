{% extends '//mix/hub.sh' %}

{% block run_deps %}
{% if linux %}
boot/0/sys
{% else %}
boot/0/mix
{% endif %}
{% endblock %}
