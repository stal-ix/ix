{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/re2c(std_box=bld/bootbox)
{% endblock %}
