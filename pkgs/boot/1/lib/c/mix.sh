{% extends '//mix/hub.sh' %}

{% block lib_deps %}
{% if linux %}
boot/1/lib/musl
{% endif %}
{% if darwin %}
lib/darwin/c
{% endif %}
{% endblock %}
