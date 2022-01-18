{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
dev/build/cmake(bld_deps=bin/bootbox/0)
{% endblock %}
