{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/surfer/unwrap(gtk_ver=3)
{% endblock %}
