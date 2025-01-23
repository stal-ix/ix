{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/build/muldefs
lib/mesa/drivers/{{mesa_driver or 'none'}}
{% endblock %}
