{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/notify/send
bin/wayst/unwrap
{% endblock %}
