{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/file
bin/notify/send
bin/xdg/open/scripts
{% endblock %}
