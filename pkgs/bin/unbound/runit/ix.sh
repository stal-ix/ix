{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/unbound
etc/user/unbound
{% endblock %}
