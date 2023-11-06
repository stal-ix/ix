{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ted/unwrap(python_ver=12)
{% endblock %}
