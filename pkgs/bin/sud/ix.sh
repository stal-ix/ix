{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/sud/runit
bin/sud/server
bin/sud/client
bin/sud/setpwd
{% endblock %}
