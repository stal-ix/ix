{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if armv7 %}
lib/build/cpu/armv7
{% endif %}
{% endblock %}
