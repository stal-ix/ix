{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=101,user=unbound)
{% endblock %}
