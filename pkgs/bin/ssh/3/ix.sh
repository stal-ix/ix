{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ssh/3/client
bin/ssh/3/server
bin/ssh/3/host/keys
{% endblock %}
