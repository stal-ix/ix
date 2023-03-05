{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/evince/unwrap(gtk_ver=4)
bin/xdg/er(wrap=evince)
{% endblock %}
