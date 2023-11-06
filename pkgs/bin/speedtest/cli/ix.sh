{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/speedtest/cli/unwrap(python_ver=12)
{% endblock %}
