{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if mesa_driver %}
lib/mesa/dl
{% endif %}
{% endblock %}
