{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/host/keys
bin/sftp/go/unwrap
{% endblock %}
