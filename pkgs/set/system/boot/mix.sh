{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/dash
bin/wget
bld/compiler
lib/python/3/10
{% endblock %}
