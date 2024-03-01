{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=107,user=avahi)
{% endblock %}
