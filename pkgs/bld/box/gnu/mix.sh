{%extends '//mix/hub.sh' %}

{% block run_deps %}
bin/gnubox(std_box=bld/bootbox,intl_ver=stub)
{% endblock %}
