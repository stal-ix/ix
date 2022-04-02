{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/cmake/lite(std_box=bld/bootbox,intl_ver=no)
{% endblock %}
