{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/dash/sh(std_box=bld/boot/box)
{% endblock %}
