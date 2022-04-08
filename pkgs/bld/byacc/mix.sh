{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/byacc/yacc(std_box=bld/bootbox,intl_ver=no)
{% endblock %}
