{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/0/mix/{{host.os}}/{{host.arch}}
{% endblock %}
