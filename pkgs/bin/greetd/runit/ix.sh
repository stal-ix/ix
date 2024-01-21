{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/greetd/d
etc/user/greeter
bin/greetd/agreety
bin/greetd/runit/slot(slot=1)
{% endblock %}
