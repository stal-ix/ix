{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/nebula/daemon
bin/nebula/runit/scripts
{% endblock %}
