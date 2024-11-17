{% extends '//die/hub.sh' %}

{% block ind_deps %}
bld/boot/4/lib/c
{% endblock %}

{% block run_deps %}
bld/boot/3/cc
bld/boot/6/env/box
bld/boot/0/env
{% endblock %}
