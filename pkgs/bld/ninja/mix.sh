{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/ninja(std_box=bld/boot/box)
{% endblock %}
