{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wireshark/tui
bin/wireshark/sudo
bin/termshark/unwrap
{% endblock %}
