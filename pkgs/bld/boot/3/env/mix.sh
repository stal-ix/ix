{% extends '//mix/hub.sh' %}

{% block ind_deps %}
bld/boot/3/lib/c
{% endblock %}

{% block run_deps %}
bld/boot/3/sh
bld/boot/3/make/1
bld/boot/2/env
{% endblock %}
