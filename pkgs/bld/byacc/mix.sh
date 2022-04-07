{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/byacc(std_box=bld/bootbox,intl_ver=no)
{% endblock %}
