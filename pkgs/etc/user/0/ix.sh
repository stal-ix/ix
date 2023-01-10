{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user(userid=10000)
{% endblock %}
