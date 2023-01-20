{% extends '//die/hub.sh' %}

{% block run_deps %}
# actually, for_target
bin/mold/{{host.os}}
{% endblock %}
