{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wireshark/tui
bin/termshark/unwrap
{% endblock %}
