{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv/cguard/unwrap(bumpalloc_buf=10000)
{% endblock %}
