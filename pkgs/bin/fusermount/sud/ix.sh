{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fusermount/sud/scripts
bin/fusermount/sud/backend
bin/python
{# Use the host's existing sud service and policy; do not replace them. #}
{% endblock %}
