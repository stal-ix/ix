{% extends '//mix/hub.sh' %}

{% block run_deps %}
boot/0/mix/{{host.os}}/{{host.arch}}
{% endblock %}
