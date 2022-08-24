{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/git/unwrap
bin/openssh/client
{% endblock %}
