{% extends '//mix/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/mesa
{% endif %}
{% if darwin %}
lib/darwin/framework/Carbon
{% endif %}
{% endblock %}
