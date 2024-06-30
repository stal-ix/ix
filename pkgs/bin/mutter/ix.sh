{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mutter/unwrap(gtk_ver=4)
{% endblock %}
