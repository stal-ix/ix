{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/real(userid=10001)
{% endblock %}
