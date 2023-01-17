{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/unbound/ix
etc/user/unbound
bin/unbound/runit/scripts
{% endblock %}
