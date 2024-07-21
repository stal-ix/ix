{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xdg/er(wrap=clapper)
bin/clapper/unwrap(gtk_ver=4)
{% endblock %}
