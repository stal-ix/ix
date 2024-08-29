{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/elementary/screenshot/unwrap(gtk_ver=4)
{% endblock %}
