{%extends '//mix/hub.sh' %}

{% block run_deps %}
set/box/gnu(std_box=bld/bootbox,intl_ver=no)
{% endblock %}
