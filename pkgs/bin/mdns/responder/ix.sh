{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdns/responder/d
bin/mdns/responder/extra
{% endblock %}
