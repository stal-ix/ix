{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/brightnessctl/sudo
bin/brightnessctl/unwrap
{% endblock %}
