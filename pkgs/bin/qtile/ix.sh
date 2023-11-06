{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/qtile/unwrap(python_ver=12)
{% endblock %}
