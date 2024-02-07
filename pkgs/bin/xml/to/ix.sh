{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/getopt
bin/xsltproc
bin/xml/to/unwrap
{% endblock %}
