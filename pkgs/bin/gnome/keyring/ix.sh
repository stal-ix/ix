{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gnome/keyring/unwrap(gtk_ver=3)
{% endblock %}
