{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/cargo/{{host.os}}
{% endblock %}
