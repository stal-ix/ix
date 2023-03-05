{% extends '//die/hub.sh' %}

{% block run_deps %}
#bin/evince/unwrap/4(gtk_ver=4)
bin/evince/unwrap
bin/xdg/er(wrap=evince)
{% endblock %}
