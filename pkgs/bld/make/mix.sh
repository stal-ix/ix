{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/make/lite(std_box=bld/bootbox,intl_ver=stub)
{% endblock %}
