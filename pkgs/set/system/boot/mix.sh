{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/dash
bin/curl
bld/compiler
lib/python/3/10
{% endblock %}
