{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/python/lite(std_box=bld/bootbox,intl_ver=no)
{% endblock %}
