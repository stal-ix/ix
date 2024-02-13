{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/git/cred
bin/git/unwrap
bin/openssh/client
{% endblock %}
