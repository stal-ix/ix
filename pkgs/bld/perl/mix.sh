{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/perl/host(std_box=bld/boot/box)
{% endblock %}
