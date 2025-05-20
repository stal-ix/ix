{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if angle %}
lib/angle/driver
{% elif mesa_driver %}
lib/mesa
{% endif %}
{% endblock %}
