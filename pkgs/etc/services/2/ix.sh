{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/services/runit(srv_slot=2)
{% endblock %}
