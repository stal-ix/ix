{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/chrony
bin/chrony/conf
{% endblock %}
