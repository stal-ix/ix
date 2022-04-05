{% extends '//mix/hub.sh' %}

{% block run_deps %}
bld/perl
bin/help2man(std_box=bld/bootbox,intl_ver=no)
{% endblock %}
