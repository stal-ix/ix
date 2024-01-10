{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/d/spy/unwrap(gtk_ver=4)
bin/xdg/er(wrap=d-spy)
{% endblock %}
