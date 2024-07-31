{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/geary/unwrap(gtk_ver=3)
{% endblock %}
