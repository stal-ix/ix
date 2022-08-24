{% extends '//die/hub.sh' %}

{% block run_deps %}
# TODO(pg): less specialized depends on more specialized
bin/openssh/d/ix
bin/openssh/client
{% endblock %}
