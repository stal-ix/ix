{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/8/env/cxx
{% endblock %}

{% block ind_deps %}
bld/boot/8/lib/c
{% endblock %}
