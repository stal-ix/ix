{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/cmake(bld_deps=bld/bootbox/0)
{% endblock %}
