{% extends '//die/hub.sh' %}

{% block run_deps %}
set/pg/unwrap(mesa_driver=aco)
{% endblock %}

{% block run_data %}
aux/fonts/inter
set/fonts/default
{% endblock %}
