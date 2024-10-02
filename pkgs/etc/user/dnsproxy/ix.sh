{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=109,user=dnsproxy)
{% endblock %}
