{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/rust/{{host.os}}
{% endblock %}
