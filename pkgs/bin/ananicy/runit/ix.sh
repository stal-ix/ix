{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ananicy
etc/services/runit(srv_dir=ananicy,srv_command=exec ananicy-cpp start)
{% endblock %}
