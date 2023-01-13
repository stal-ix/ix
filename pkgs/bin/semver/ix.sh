{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/semver/unwrap(python_ver=11)
{% endblock %}
