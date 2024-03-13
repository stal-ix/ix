{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/sudoer/fix
etc/sudoer/record
{% endblock %}
