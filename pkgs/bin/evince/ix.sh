{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/evince/unwrap(gtk_ver=3)
bin/xdg/er(wrap=evince)
{% endblock %}
