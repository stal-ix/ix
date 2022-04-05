{% extends '//mix/hub.sh' %}

{% block run_deps %}
bld/m4
bin/flex(std_box=bld/bootbox,intl_ver=no)
{% endblock %}
