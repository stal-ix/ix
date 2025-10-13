{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ted/unwrap(python_ver=14)
{% endblock %}
