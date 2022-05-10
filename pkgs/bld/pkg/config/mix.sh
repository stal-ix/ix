{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/pkg/config(std_box=bld/boot/box,intl_ver=no)
{% endblock %}
