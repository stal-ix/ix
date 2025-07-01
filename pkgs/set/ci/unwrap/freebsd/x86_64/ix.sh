{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/unbound
set/compress
{% endblock %}
