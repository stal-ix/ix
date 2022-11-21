{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sudo/er(wrap=brightnessctl)
bin/brightnessctl/unwrap
{% endblock %}
