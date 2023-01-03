{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/iwgtk/unwrap(gtk_ver=4)
bin/xdg/er(wrap=iwgtk)
{% endblock %}
