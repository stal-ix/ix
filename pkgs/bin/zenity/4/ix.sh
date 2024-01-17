{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/zenity/4/unwrap(gtk_ver=4)
{% endblock %}
