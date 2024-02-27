{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ptyxis/unwrap(gtk_ver=4)
bin/xdg/er(wrap=ptyxis)
{% endblock %}
