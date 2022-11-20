{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sudo/wrapper(wrap=light)
bin/light/unwrap
{% endblock %}
