{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/jq
bin/basuctl
bin/mako/unwrap
{% endblock %}
