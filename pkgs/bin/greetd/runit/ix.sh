{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/greetd
etc/user/greeter
bin/greetd/runit/slot(slot=1)
{% endblock %}
