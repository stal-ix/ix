{% extends '//die/hub.sh' %

{% block run_deps %}
bin/avizo/unwrap(gtk_ver=3)
{% endblock %}
