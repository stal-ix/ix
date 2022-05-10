{% extends '//mix/hub.sh' %}

{% block ind_deps %}
bld/boot/3/lib/c
{% endblock %}

{% block run_deps %}
bld/boot/5/env/box
bld/boot/0/env
{% endblock %}
