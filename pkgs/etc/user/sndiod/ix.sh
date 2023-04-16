{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=102,user=sndiod)
{% endblock %}
