{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/minder/unwrap(gtk_ver=4)
bin/xdg/er(wrap=minder)
{% endblock %}
