{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/pkg-config(std_box=bld/bootbox,intl_ver=stub)
{% endblock %}
