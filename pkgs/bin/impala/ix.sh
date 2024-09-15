{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/iwd/ctl
bin/impala/unwrap
{% endblock %}
