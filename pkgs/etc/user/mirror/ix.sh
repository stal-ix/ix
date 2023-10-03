{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=103,user=mirror)
{% endblock %}
