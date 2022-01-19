{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/cmake(bld_deps=bin/bootbox/0)
{% endblock %}
