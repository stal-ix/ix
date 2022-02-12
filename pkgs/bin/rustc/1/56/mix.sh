{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/rustc/1/56/{{host.os}}
{% endblock %}
