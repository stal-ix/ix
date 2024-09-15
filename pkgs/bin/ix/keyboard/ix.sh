{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/evsieve
bin/brightnessctl
bin/ix/keyboard/runit(srv_deps=bin/evsieve,srv_dir=evsieve)
{% endblock %}
