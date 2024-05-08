{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/python/frozen/unwrap(python_ver=12)
{% endblock %}
