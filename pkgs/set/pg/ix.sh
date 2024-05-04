{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if system_realm %}
set/pg/system
{% else %}
set/pg/user(mesa_driver=aco)
{% endif %}
{% endblock %}
