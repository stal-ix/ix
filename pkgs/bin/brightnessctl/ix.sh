{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sudo/wrapper(wrap=brightnessctl)
bin/brightnessctl/unwrap
{% endblock %}
