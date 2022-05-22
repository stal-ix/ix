{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/perf/unwrap(openssl=1)
{% endblock %}
