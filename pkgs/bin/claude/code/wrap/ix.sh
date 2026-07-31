{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wrap
bin/claude/code
bin/claude/code/wrap/scripts
{% endblock %}
