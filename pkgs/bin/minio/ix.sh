{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/minio/client
bin/minio/daemon
{% endblock %}

