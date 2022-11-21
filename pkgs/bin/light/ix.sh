{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sudo/er(wrap=light)
bin/light/unwrap
{% endblock %}
