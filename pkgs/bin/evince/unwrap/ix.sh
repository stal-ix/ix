{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/evince/{{gtk_ver}}
{% endblock %}
