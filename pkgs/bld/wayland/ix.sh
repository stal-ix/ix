{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wayland/scanner
bin/wayland/protocols
{% endblock %}
