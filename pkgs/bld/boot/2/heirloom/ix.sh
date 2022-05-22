{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/2/heirloom/{{target.os}}
{% endblock %}
