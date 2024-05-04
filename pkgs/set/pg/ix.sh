{% extends '//die/hub.sh' %}

{% block run_deps %}
set/pg/user(mesa_driver=aco)
{% endblock %}
