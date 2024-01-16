{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/zenity/3/unwrap(gtk_ver=3)
{% endblock %}
