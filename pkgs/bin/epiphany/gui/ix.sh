{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/webkitproc
#bin/epiphany/gui/fixdrv
bin/epiphany/stock(gtk_ver=4)
{% endblock %}
