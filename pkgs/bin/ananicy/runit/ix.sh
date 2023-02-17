{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ananicy
etc/services/runit(srv_slot=system,srv_name=ananicy,srv_command=ananicy-cpp start)
{% endblock %}
