{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/openssh/client
bin/subversion/unwrap(openssl=1)
{% endblock %}
