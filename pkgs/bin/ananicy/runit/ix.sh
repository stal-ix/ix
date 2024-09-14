{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ananicy
etc/services/runit(srv_deps=bin/ananicy,srv_dir=ananicy,srv_command=exec ananicy-cpp --force-remove-semaphore start)
{% endblock %}
