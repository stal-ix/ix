{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=108,user=ftp)
{% endblock %}
