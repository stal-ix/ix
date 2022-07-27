{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/liner
bin/runsrv
bin/sud/runit
bin/sud/server
bin/sud/client
{% endblock %}
